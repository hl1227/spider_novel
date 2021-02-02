import requests,time,json,pymysql,random,re,os,hashlib,urllib3
from datetime import datetime
from lxml import etree
from config import sql_config,path_config
from xpinyin import Pinyin
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class Update_chapter(object):
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
        path=path_config()
        self.txt_path=path[1]
    def cate(self):
        # cate_list=['玄幻魔法', '玄幻小说','玄幻奇幻'
        #           '修真小说''武侠修真''武侠仙侠''同人小说'
        #            '都市言情''都市小说''绝对宠文''女生频道''散文诗词''男生福利',
        #            '侦探推理', 恐怖灵异',
        #             '科幻小说','科幻灵异',
        #            '穿越小说', ,
        #            '历史军事'
        #            , '网游动漫','网游竞技''网游小说'
        #             '未分类'  '其他类型'
        #            '其它小说''其他小说'
        # for cate in cate_list:
        #
        #     category=self.b_novel_parse(cate)
        #     print(category)

        find_id_cate="select id,title from b_novel where category=22 or category=65 or category=63 or category >147 and category <155"
        self.cur.execute(find_id_cate)
        id_cate_t=self.cur.fetchall()
        for id_cate in id_cate_t:
            cate=random.choice([66,67,68,157,158,159,160,161,162])
            update = "update b_novel set category = %s where id =%s"
            self.cur.execute(update, (cate, id_cate[0]))
            print(id_cate,'更新成功:',cate)
        self.conn.commit()
    def jianjie(self):

        update="update b_novel set content = %s where length(content) < 11 and id < 19100 "
        self.cur.execute(update, ("欢迎使用小说宝免费阅读神器，全网最优质资源，及时更新。如果您觉得不错，请向身边的朋友推荐分享，谢谢！",))
        print('简介替换成功')
        self.conn.commit()


    def b_novel_parse(self,cate):
        #分类处理
        if '玄幻' in  cate or '魔法' in  cate or '奇幻' in  cate:
            category = random.choice([89,90,70,95,60,61,62,96,97,98,165,166,167,168,169,170,171])
        elif '仙侠' in  cate or '修真' in  cate or '武侠' in cate or '同人' in cate:
            category= random.choice([21, 26, 27,101,102,28,29,30,99,100,23,69,94,155,156])
        elif '都市小说' in  cate   or '男生' in cate :
            category = random.choice([20,24,25,103,104,105])
        elif '都市言情' in cate or '散文' in  cate or '宠文' in  cate or '女生' in cate or '其' in  cate:
            category = random.choice([71,72,73,163,66,67,68,157,158,159,160,161,162])
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
        return category
    def update_content(self,id,delete):
        b_chapter_num=id // 1000 +1
        find_txtname="select content from b_chapter_{} where novel_id =%s ".format(b_chapter_num)
        self.cur.execute(find_txtname,id)
        ch_t=self.cur.fetchall()
        for sql_path in ch_t:
            txt_path=self.txt_path+sql_path[0].replace('/upload/chapter_txt/','')
            f=open(txt_path,'r',encoding='utf-8')
            content=f.read()
            for delede0 in delete:
                content=content.replace(delede0,'')
            open(txt_path,'w',encoding='utf-8').write(content)
        print('章节内容修复成功id:',id)

#Update_chapter().cate()
#Update_chapter().jianjie()
up_cha_j=[
            {'id':11616,'delete':['1;148471591054062']},
            {'id':18584,'delete':['中文网']},
            {'id':18628,'delete':['书客居阅读网址','记住手机版网址']},
            {'id':28405,'delete':['https:','天才一秒记住本站地址：.。手机版阅读网址：m.']},
            {'id':6,'delete':['推荐都市大神老施新书:']},
            {'id':980,'delete':['推荐都市大神老施新书：']},
            {'id':971,'delete':['推荐都市大神老施新书：','风云小说阅读网手机版阅读网址：','请记住本书首发域名：']},
            {'id':973,'delete':['推荐都市大神老施新书：']},
            {'id':28559,'delete':['请记住本书首发域名：.。','手机版阅读网址：m.','https:','。手机版更新最快网址：m.']},
            {'id':14053,'delete':['天才一秒记住本站地址：.。','笔趣阁手机版阅读网址：m.']}]
for up_cha_d in up_cha_j:
    Update_chapter().update_content(id=up_cha_d['id'],delete=up_cha_d['delete'])


# up_cha_d=[{'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']},
#           {'id':1,'delete':[''+'\n',''+'\n',''+'\n']}]

#-------------------- ID删除小说-------------------------------------------------------------
def delede_novel(novel_id):
    #小说表
    find_novel="select id,title,author,pic,position from b_novel where id =%s"
    cur.execute(find_novel,novel_id)
    novel_info_t=cur.fetchall()
    for novel_info in novel_info_t:
        #记录删除
        if novel_info[4] ==0:hot=" "
        else:hot = "热门小说"
        open('delede_7k_xb.txt','a',encoding='utf-8').write('删除小说名:'+novel_info[1]+'    作者:'+novel_info[2]+'    hot:'+hot+'\n')
        try:
            # 删除封面文件
            img_path = path_config()[0] + novel_info[3].replace('/upload/novel_img/', '')
            os.remove(img_path)
        except Exception:pass
    b_novel="delete from b_novel where id =%s"
    cur.execute(b_novel,novel_id)
    #小说章节
    cha_sql_name='b_chapter_{}'.format(novel_id//1000+1)
    find_conent="select content from {} where novel_id =%s".format(cha_sql_name) %novel_id
    cur.execute(find_conent)
    cha_path_t=cur.fetchall()
    for cha_path in cha_path_t:
        try:
            # 删除章节文件
            txt_path = path_config()[1] + cha_path[0].replace('/upload/chapter_txt/', '')
            os.remove(txt_path)
        except Exception:
            pass
    delede_cha="delete from %s where novel_id=%s" %(cha_sql_name,novel_id)
    cur.execute(delede_cha)
    #删除换源
    f_source="select id from b_source where novel_id = %s"
    cur.execute(f_source,novel_id)
    sou_id_t=cur.fetchall()
    for sou_id in sou_id_t:
        sou_sql_name='b_source_list_{}'.format(sou_id[0]//500+1)
        delete_sou_list="delete from %s where source_id = %s" %(sou_sql_name,sou_id[0])
        cur.execute(delete_sou_list)
    delete_sou="delete from b_source where novel_id =%s"
    cur.execute(delete_sou,novel_id)
    conn.commit()
    print(novel_info[1],'删除成功')