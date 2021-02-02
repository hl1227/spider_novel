# -*- coding: utf-8 -*-
# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
import requests,time,json,pymysql,random,re,os,hashlib,urllib3,stat
from lxml import etree
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
from config import sql_config,path_config
class Xs1TPipeline(object):
    def open_spider(self, spider):
        sql_date=sql_config()
        self.conn = pymysql.Connect(
            host=sql_date["host"],
            port=sql_date["port"],
            #数据库名：
            db=sql_date["db"],
            user=sql_date["user"],
            passwd=sql_date["passwd"],
            charset=sql_date["charset"])
        self.cur = self.conn.cursor()
        path=path_config()
        self.img_path=path[0]
        self.txt_path=path[1]
    def process_item(self, item, spider):
        if item.__class__.__name__ == "Info" :
            find_ex = "select id,title from b_novel where title = %s and author =%s"
            self.cur.execute(find_ex, (item["name"], item["author"]))
            try:
                if not self.cur.fetchone():
                    #b_novel入库
                    convert_data=self.b_novel_parse(item["cate"],item["name"],item['img_url'],item["last_time"])
                    b_novel="insert into b_novel(" \
                            "category,title,author,pic,content,tag,favorites,create_time,update_time,status) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                    self.cur.execute(b_novel,(convert_data[0],item["name"],item["author"],convert_data[1],item["intro"],item["cate"],random.randint(10,100),time.time(),convert_data[2],0))
                #本页面换源
                    #取小说ID
                    find_novel_id = 'select id from b_novel where title= %s and author = %s'
                    self.cur.execute(find_novel_id,(item["name"],item['author']))
                    b_novel_id = self.cur.fetchone()[0]
                    # 换源入库
                    b_source="insert into b_source( " \
                             "novel_id,reurl,update_time,url,chapter_sum,element,create_time,chapter_name) values (%s,%s,%s,%s,%s,%s,%s,%s)"
                    self.cur.execute(b_source,(b_novel_id,item["index_name"],time.time(),item["home_url"],len(item["chapter_title_list"]),item['element'],time.time(),item["chapter_title_list"][-1]))
                    #取换源ID
                    source_id = self.conn.insert_id()
                    #换源分表
                    source_dbname='b_source_list_{}'.format(source_id//500+1)
                    for num in range(0,len(item["chapter_title_list"])):
                        #id转md5 : 章节名+3位随机数
                        chapter_title=item["chapter_title_list"][num]
                        source_l_id=chapter_title+str(time.time()) +str(random.randint(1000, 10000))
                        m = hashlib.md5(source_l_id.encode('utf-8'))
                        source_id_md5=m.hexdigest()
                        insert_source_l="insert into %s(id,chapter_num,chapter_name,chapter_url,source_id) values('%s',%s,'%s','%s',%s)" %(
                            source_dbname,str(source_id_md5),num+1,chapter_title,item["chapter_url_list"][num],source_id)
                        try:
                            self.cur.execute(insert_source_l)
                        except Exception:
                            self.add_source_db(source_dbname)
                            self.cur.execute(insert_source_l)
                    self.conn.commit()
                    if len(item["intro"]) <= 5:
                        open('err.txt', 'a', encoding='utf-8').write("***简介错误小说名:" + item["name"] + '\n')
                    print(item["name"], '入库成功')
                # 其他换源
                    for index_name in ['笔趣阁2', '56书库']:
                        try:
                            self.b_source_parse(index_name,item['name'],item["author"],b_novel_id)
                            self.conn.commit()
                            print(index_name, '换源成功')
                        except Exception:
                            print(index_name, '换源失败')
                            self.conn.rollback()
                else:print('书名:',item["name"],'作者:',item["author"],'已经存在')
            except Exception as e:
                print(item["name"],'入库失败')
                open('err.txt','a',encoding='utf-8').write("***入库失败错误小说名:"+item["name"]+'错误原因:'+ str(e) +'\n')
                self.conn.rollback()
                spider.crawler.engine.close_spider(spider)
        if item.__class__.__name__ == 'Chapter' :
        #取ID
            f_novel_id="select id from b_novel where title = %s and author = %s"
            self.cur.execute(f_novel_id,(item["name"],item["author"]))
            try:
                novel_id=self.cur.fetchone()[0]
            except Exception:
                print(item["name"],item["chapter_title"],"章节入库失败")
                spider.crawler.engine.close_spider(spider)
        #章节分表
            chapter_dbname='b_chapter_{}'.format(novel_id//1000+1)
        #验证章节是否存在:
            find_cha="select id,novel_id from {} where novel_id = %s and weigh = %s".format(chapter_dbname)
            self.cur.execute(find_cha,(novel_id,item["chapter_num"]))
            if  self.cur.fetchone() == None:
                #解析章节数据
                chapter_date=self.b_chapter_parse(item["chapter_title"],item["chapter_content"])
                #状态
                status=1
                if len(item["chapter_content"]) < 15:
                    status=0
                    open('err.txt','a',encoding='utf-8').write(str({"错误ID":novel_id,"错误小说名":item["name"],"错误章节名":item["chapter_title"],"错误章节数":item["chapter_num"]})+'\n')
                #b_chapter入库
                insert_chapter = "insert into {}(id,novel_id,title,content,status,update_time,weigh,word) values(%s,%s,%s,%s,%s,%s,%s,%s)".format(chapter_dbname)
                try:
                    self.cur.execute(insert_chapter,(chapter_date[0],novel_id,item["chapter_title"],chapter_date[1],status,time.time(),item["chapter_num"],len(item["chapter_content"])))
                    print(item["name"],item["chapter_num"],item["chapter_title"],'入库成功')
                except Exception:
                    self.cur.execute(insert_chapter,(chapter_date[0],novel_id,item["chapter_title"],'',0,time.time(),item["chapter_num"],0))
                    open('err.txt', 'a', encoding='utf-8').write(str({"错误ID": novel_id, "错误小说名": item["name"], "错误章节名": item["chapter_title"],"错误章节数": item["chapter_num"]}) + '\n')
            #本地
                # open('ceshi.json','a',encoding='utf-8').write(str(item))
        return item
    def close_spider(self, spider):
        # 更新字数 / 最后章节
        find_id = "select id from b_novel where word = 0 and new_num=0"
        self.cur.execute(find_id)
        up_id_t = self.cur.fetchall()
        for up_id in up_id_t:
            try:
                # word
                dbname = 'b_chapter_{}'.format(str(up_id[0]//1000+1))
                find_word = "select sum(word) from {} where novel_id =%s".format(dbname)
                self.cur.execute(find_word, up_id[0])
                word = self.cur.fetchone()[0]
                # last_chapter
                find_lastcha = "select title,weigh from {} where weigh=(select max(weigh) from {} where novel_id = %s) and novel_id = %s".format(dbname, dbname)
                self.cur.execute(find_lastcha, (up_id[0], up_id[0]))
                last_t = self.cur.fetchall()
                print(last_t[0], up_id[0])
                # update novel
                update_novel = "update b_novel set new_num= %s ,new_name = %s ,word= %s,status = 1 where id = %s"
                self.cur.execute(update_novel, (last_t[0][1], last_t[0][0], word, up_id[0]))
            except Exception:
                continue
        self.conn.commit()
        self.conn.close()
        print('********爬取完毕********')
    def b_novel_parse(self,cate,name,img_url,last_time):
        #分类处理
        if '玄幻' in  cate or '魔法' in  cate or '奇幻' in  cate:
            category = random.choice([89,90,70,95,60,61,62,96,97,98,165,166,167,168,169,170,171])
        elif '仙侠' in  cate or '修真' in  cate or '武侠' in cate or '同人' in cate:
            category = random.choice([21, 26, 27,101,102,28,29,30,99,100,23,69,94,155,156])
        elif '都市小说' in  cate   or '男生' in cate :
            category = random.choice([20,24,25,103,104,105])
        elif '都市言情' in cate or '散文' in  cate or '宠文' in  cate or '女生' in cate or '其' in  cate:
            category = random.choice([71,72,73,163,66,67,68,157,158,159,160,161,162])
        elif '豪门' in cate:
            category = random.choice([66, 67, 68, 157, 158, 159, 160, 161, 162])
        elif '穿越' in  cate or '重生' in  cate:
            category = random.choice([193,194,195])
        elif '科幻' in  cate :
            category = random.choice([134,135,136,137,139,140,180,182,183,184,185,186])
        elif '网游' in  cate or '游戏' in  cate or '竞技' in  cate or '动漫' in  cate:
            category = random.choice([124,125,126,127,128,188,189,190,191])
        elif '军事' in  cate or '历史' in  cate or '战' in  cate :
            category = random.choice([107,108,109,110,111,113,114,115,116,117,118,119,120,121,122])
        elif '悬疑' in  cate or '灵异' in  cate or '侦探' in  cate or '推理' in  cate or '恐怖' in  cate:
            category = random.choice([173,174,175,176,177,178,142,143,144,146,147])
        else:
            category = random.choice([173,174,175,176,177,178,142,143,144,146,147])
        #封面处理
        base_img_name = name + str(random.randrange(100, 10000))
        m = hashlib.md5()
        m.update(base_img_name.encode('utf-8'))
        base_imgname_md5 = m.hexdigest() + '.jpg'
        # 封面存放路径/年月日
        img_time_name=time.strftime("%Y-%m-%d", time.localtime(time.time())).replace('-', '')
        base_img_path = self.img_path + img_time_name
        if not os.path.exists(base_img_path):
            os.mkdir(base_img_path)
        try:
            img_date=requests.get(url=img_url,verify=False).content
            open(base_img_path + '/' + base_imgname_md5, 'wb').write(img_date)
            pic='/upload/novel_img/'+img_time_name+'/'+base_imgname_md5
        except Exception as e:
            open('err.txt','a',encoding='utf-8').write('**封面错误:  ' + name + '  无封面  ' + str(e)+'\n')
            pic=''
        #时间处理
        last_time0 = int(time.mktime(time.strptime(last_time, "%Y-%m-%d")))
        return category,pic,last_time0
    def b_source_parse(self,index_name, novel_name, novel_author, novel_id):
        def name_author_parse(date, url_xpath, author_xpath):
            url_list = date.xpath(url_xpath)
            author_list = date.xpath(author_xpath)
            return url_list[author_list.index(novel_author)]
        if index_name == '笔趣阁2':
            url, charset = 'https://www.boquge.com/search.htm?keyword={}'.format(novel_name), 'gbk'
            author_xpath, element = '//li[@class="list-group-item clearfix"][position()>1]/div[@class="col-xs-2"][1]/text()', '#txtContent'
            index_url, name_xpath, url_xpath = 'https://www.boquge.com', "//h1/text()", "//li[@class='list-group-item clearfix'][position()>1]/div[@class='col-xs-3']/a/@href"
            cha_title_xpath, cha_url_xpath = '//ul[@id="chapters-list"]//a/text()', '//ul[@id="chapters-list"]//a/@href'
            res = requests.get(url,timeout=10,verify=False).content.decode(charset)
            date = etree.HTML(res)
            nourl = name_author_parse(date, url_xpath, author_xpath)
            chapter_index_num = re.match(".*/xs/(\d+)", nourl)
            no_url = 'https://www.boquge.com/book/{}/'.format(chapter_index_num.group(1))
        if index_name == '56书库':
            url_xpath, author_xpath = '//div[@id="articlelist"]//span[@class="l2"]/a/@href', '//div[@id="articlelist"]/ul[2]//span[@class="l8"][2]/text()'
            url, data, charset = 'http://www.pingshuku.com/modules/article/search.php', {"searchkey": novel_name}, 'utf-8'
            index_url, name_xpath, element = 'http://www.pingshuku.com', "//div[@class='infot']/h1/text()", '#content'
            cha_title_xpath, cha_url_xpath = '//div[@class="dccss"]/a/text()', '//div[@class="dccss"]/a/@href'
            res = requests.post(url, data=data,timeout=10).content.decode(charset)
            date = etree.HTML(res)
            nourl = name_author_parse(date, url_xpath, author_xpath)
            no_url = index_url + nourl
        res2 = requests.get(no_url,timeout=10,verify=False).content.decode(charset)
        date2 = etree.HTML(res2)
        cha_title_list = date2.xpath(cha_title_xpath)
        cha_url_list = date2.xpath(cha_url_xpath)
        name = date2.xpath(name_xpath)[0].strip()
        #其他换源入库
        b_source = "insert into b_source(" \
                   "novel_id,reurl,update_time,url,chapter_sum,element,create_time,chapter_name) values (%s,%s,%s,%s,%s,%s,%s,%s)"
        self.cur.execute(b_source, (novel_id, index_name, time.time(), no_url, len(cha_url_list), element, time.time(),cha_title_list[-1]))
        source_id = self.conn.insert_id()
        #其他换源分表入库
        if name == novel_name:
            source_l_num = source_id // 500 + 1
            source_dbname = 'b_source_list_{}'.format(str(source_l_num))
            for num in range(0, len(cha_url_list)):
                json_dict = {}
                json_dict['chapter_name'] = cha_title_list[num].replace("'","").replace('"', '').replace('\n', '').replace('\\','').replace('	', '')
                if index_name == '56书库':
                    json_dict['chapter_url'] = no_url + cha_url_list[num]
                else:
                    json_dict['chapter_url'] = index_url + cha_url_list[num]
                # id转md5 : 章节名+3位随机数
                source_l_id = json_dict['chapter_name'] +str(time.time()) +str(random.randint(1000, 10000))
                m = hashlib.md5(source_l_id.encode('utf-8'))
                source_id_md5 = m.hexdigest()
                insert_source_l = "insert into %s(id,chapter_num,chapter_name,chapter_url,source_id) values('%s',%s,'%s','%s',%s)" % (
                    source_dbname, str(source_id_md5), num + 1, json_dict['chapter_name'], json_dict['chapter_url'],source_id)
                self.cur.execute(insert_source_l)
    def b_chapter_parse(self,cha_title,cha_content):
        #id处理
        id=str(time.time())+cha_title+str(random.randint(10000,100000))
        m = hashlib.md5(id.encode('utf-8'))
        chapter_id_md5 = m.hexdigest()
        #content存text
        base_txt_name=cha_title+str(time.time())+str(random.randint(10000,100000))
        m = hashlib.md5()
        m.update(base_txt_name.encode('utf-8'))
        base_txtname_md5 = m.hexdigest() + '.txt'
        #章节TXT存放路径/年月日
        cha_time_name=time.strftime("%Y-%m-%d", time.localtime(time.time())).replace('-', '')
        base_txt_path = self.txt_path + cha_time_name
        if not os.path.exists(base_txt_path):
            os.mkdir(base_txt_path)
        open(base_txt_path+'/'+base_txtname_md5,'w',encoding='utf-8').write(cha_content)
        content_txt_path='/upload/chapter_txt/'+cha_time_name+'/'+base_txtname_md5
        return chapter_id_md5,content_txt_path
    def add_source_db(self,source_dbname):
        add_source_db = '''
        CREATE TABLE IF NOT EXISTS `{}`  (
          `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
          `chapter_num` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT \'章节数\',
          `chapter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT \'章节名\',
          `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT \'章节链接\',
          `source_id` int(10) UNSIGNED NOT NULL COMMENT \'换源ID\',
          PRIMARY KEY (`id`) USING BTREE,
          INDEX `source_id`(`source_id`) USING BTREE,
          INDEX `chapter_num`(`chapter_num`) USING BTREE
        ) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = \'换源章节表\' ROW_FORMAT = Dynamic;
        '''.format(source_dbname)
        cur.execute(add_source_db)
        conn.commit()

