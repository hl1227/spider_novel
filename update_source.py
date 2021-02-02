import requests,time,json,pymysql,random,re,os,hashlib,urllib3
from lxml import etree
from datetime import datetime
from config import sql_config
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class Update_source(object):
    def __init__(self):
        sql_date = sql_config()
        self.conn = pymysql.Connect(
            host=sql_date["host"],
            port=sql_date["port"],
            #数据库名：
            db=sql_date["db"],
            user=sql_date["user"],
            passwd=sql_date["passwd"],
            charset=sql_date["charset"])
        self.cur = self.conn.cursor()
        f_m_i = "select max(id) from b_novel"
        self.cur.execute(f_m_i)
        self.max_id = self.cur.fetchone()[0]
    def sql_date(self,max_num):
        open('update_novel.log','a',encoding='utf-8').write('#########'+str(datetime.now())[0:19]+'  执行换源更新任务########\n')
        end_num = self.max_id // max_num + 1
        t1=time.time()
        for number in range(0,max_num):
            sql_date="select id,title from b_novel where status=1 and serialize = 0 and id >%s and id <=%s" %(number*end_num,(number+1)*end_num)
            self.cur.execute(sql_date)
            sql_novel=self.cur.fetchall()
            for id_title in sql_novel:
                find_sql_url="select id,url,chapter_sum,chapter_name from b_source where novel_id= %s "
                self.cur.execute(find_sql_url,id_title[0])
                id_url_t =self.cur.fetchall()
                if len(id_url_t)>1:
                    #print(1, id_url_t)
                    try:
                        self.source_parse(id_url_t,id_title[1])
                    except Exception as e:
                        open('update_novel.log', 'a', encoding='utf-8').write('**换源更新失败'+str(id_title[0])+id_title[1]+str(e)+'\n')
                        print('**换源更新失败,id:',id_title[0],'小说名:',id_title[1],e)
                        continue
            if time.time()-t1 > 9000:break
        when_time = (time.time() - t1) / 60
        open('update_novel.log', 'a', encoding='utf-8').write('#########'+str(datetime.now())[0:19]+'  结束换源更新任务,耗时:'+str(float('%.2f' %when_time))+'分钟########\n')


    def source_parse(self,id_url_t,novel_name):
        for id_url in id_url_t:
            source_id,url,last_chapter_sum,last_chapter_name = id_url[0],id_url[1],id_url[2],id_url[3]
            if 'boquge.com' in url:
                pinjie_url,title_xpath, url_xpath, charset ,index_name = 'https://www.boquge.com','//ul[@id="chapters-list"]//a/text()','//ul[@id="chapters-list"]//a/@href','gbk','笔趣阁2'
            elif 'pingshuku.com' in url:
                pinjie_url,title_xpath, url_xpath, charset ,index_name= url,'//div[@class="dccss"]/a/text()','//div[@class="dccss"]/a/@href','utf-8','56书库'
            else:continue
            try:
                res=requests.get(url,headers=self.header(),verify=False,timeout=10).content.decode(charset)
            except Exception as e:
                open('update_novel.log', 'a', encoding='utf-8').write('**换源更新失败,小说名:' + novel_name + '  '+ url+ str(e) + '\n')
                print('**换源更新失败,小说名:',index_name,url,e)
                continue
            date=etree.HTML(res)
            title_list= date.xpath(title_xpath)
            url_list  = date.xpath(url_xpath)
            try:
                seat=title_list.index(last_chapter_name,-1)
            except Exception:
                open('update_novel.log','a', encoding='utf-8').write('**换源更新失败,未匹配到小说:  '+novel_name+'  章节名:  '+last_chapter_name+'\n')
                continue
            if len(title_list) > seat+1:
                for num in range(seat+1,len(title_list)):
                    last_chapter_sum+=1
                    get_dict={"chapter_num":last_chapter_sum,
                              "chapter_name":title_list[num].replace("'","").replace('"', '').replace('\n', '').replace('\\','').replace('	', ''),
                              "chapter_url":pinjie_url+url_list[num]}
                    self.source_in_sql(source_id,get_dict)
                update_source="update b_source set update_time = %s,chapter_sum = %s, chapter_name= %s where id = %s"
                self.cur.execute(update_source,(time.time(),get_dict["chapter_num"],get_dict["chapter_name"],source_id))
                self.conn.commit()
                print(novel_name,index_name,'换源更新成功')
            # if len(title_list) > last_chapter_sum:
            #     for num in range(last_chapter_sum,len(title_list)):
            #         get_dict={"chapter_num":num+1,
            #                   "chapter_name":title_list[num].replace("'","").replace('"', '').replace('\n', '').replace('\\','').replace('	', ''),
            #                   "chapter_url":pinjie_url+url_list[num],}
            #         self.source_in_sql(source_id,get_dict)
            #     update_source="update b_source set update_time = %s,chapter_sum = %s, chapter_name= %s where id = %s"
            #     self.cur.execute(update_source,(time.time(),get_dict["chapter_num"],get_dict["chapter_name"],source_id))
            #     #self.conn.commit()
            #     print(novel_name,index_name,'换源更新成功')
            elif len(title_list) == seat+1:
                print(novel_name,index_name,'换源无更新')
            else:
                print('***err',novel_name,index_name,'网站个数:',len(title_list),'数据库个数:',last_chapter_sum,url)
                open('update_novel.log','a', encoding='utf-8').write('***err小说名:  '+novel_name+'  网站获取个数:'+str(len(title_list))+'  数据库个数:'+str(last_chapter_sum)+'  错误网址:'+url+'\n')

    def source_in_sql(self,source_id,get_dict):
        source_l_name='b_source_list_{}'.format(str(source_id//500+1))
        source_l_id = get_dict["chapter_name"] + str(time.time()) + str(random.randint(1000, 10000))
        m = hashlib.md5(source_l_id.encode('utf-8'))
        source_id_md5 = m.hexdigest()
        insert_source_l = "insert into %s(id,chapter_num,chapter_name,chapter_url,source_id) values('%s',%s,'%s','%s',%s)" % (
            source_l_name, str(source_id_md5), get_dict["chapter_num"], get_dict["chapter_name"],get_dict["chapter_url"], source_id)
        self.cur.execute(insert_source_l)
        #print(222,source_l_name, str(source_id_md5), get_dict["chapter_num"], get_dict["chapter_name"],get_dict["chapter_url"], source_id)
    def header(self):
        UA_list = [
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
            "Mozilla/5.0(compatible;MSIE9.0;WindowsNT6.1;Trident / 5.0",
            "Mozilla/4.0(compatible;MSIE8.0;WindowsNT6.0;Trident/4.0)",
            "Mozilla/4.0(compatible;MSIE7.0;WindowsNT5.1;360SE)",
            "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0",
            "Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1",
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Safari/537.36",
            "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
            "Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.0; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/233.70 Safari/534.6 TouchPad/1.0",
            "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
            "Mozilla/5.0(Macintosh;IntelMacOSX10.6;rv:2.0.1)Gecko/20100101Firefox/4.0.1"]
        UA={ "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
            "Accept-Language":"zh-CN,zh;q=0.9",
             "User_Agent":random.choice(UA_list)}
        return UA

Update_source().sql_date(8)