import requests,time,json,pymysql,random,re,os,hashlib,urllib3
from datetime import datetime
from lxml import etree
from config import sql_config,path_config
from xpinyin import Pinyin
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


sql_date = sql_config()
conn = pymysql.Connect(
            host=sql_date["host"],
            port=sql_date["port"],
            #数据库名：
            db=sql_date["db"],
            user=sql_date["user"],
            passwd=sql_date["passwd"],
            charset=sql_date["charset"])
cur = conn.cursor()
#-------------------------------------------------------------
def repair_source_last_cha(source_id,last_chapter_sum):
    source_l_name='b_source_list_{}'.format(str(source_id//500+1))
    delete_last_cha="delete from {} where chapter_num= %s and source_id = %s".format(source_l_name)
    cur.execute(delete_last_cha,(last_chapter_sum,source_id))
    find_last_date="select chapter_num,chapter_name from {} where source_id=%s ORDER BY chapter_num desc LIMIT 1".format(source_l_name)
    cur.execute(find_last_date,(source_id,))
    max_num_name=cur.fetchone()
    update_source = "update b_source set chapter_sum=%s,chapter_name=%s where id = %s"
    cur.execute(update_source,(max_num_name[0],max_num_name[1],source_id))
    conn.commit()
#repair_source_last_cha(20,855)
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
# f="select novel_id from b_source where reurl='新笔趣阁' or reurl='奇快中文' "
# cur.execute(f)
# name_t=cur.fetchall()
# for name in name_t:
#     a=name[0]
#     delede_novel(a)
#----------------------------------------删除6W本链接----------------------------------------------------

# def url_num():
#     f = open('add_hot_novel0729.txt','r').readlines()
#     return f
# print(url_num()[121])
# f2=open('url000.txt','a')
# num=0
# for url in url_num():
#     if num>121 and 'a6ksw' in url:
#         continue
#     else:
#         f2.write(url)
#     num += 1


# #
# #
# seat = len(title_list) - title_list[::-1].index(a)-1
# print(seat)
# print(len(c)-c[::-1].index(a)-1)
#----------------------------------------------------
# class Bajiudaili(object):
#     #抓取89免费代理
#     def __init__(self):
#         headers = [{"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36"},
#                    {"User-Agent": "Mozilla/5.0(compatible;MSIE9.0;WindowsNT6.1;Trident / 5.0"},
#                    {"User-Agent": "Mozilla/4.0(compatible;MSIE8.0;WindowsNT6.0;Trident/4.0)"},
#                    {"User-Agent": "Mozilla/4.0(compatible;MSIE7.0;WindowsNT5.1;360SE)"},
#                    {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0"},
#                    {"User-Agent": "Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"},
#                    {"User-Agent": "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50"},
#                    {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11"},
#                    {"User-Agent": "Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.0; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/233.70 Safari/534.6 TouchPad/1.0"},
#                    {"User-Agent": "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50"},
#                    {"User-Agent": "Mozilla/5.0(Macintosh;IntelMacOSX10.6;rv:2.0.1)Gecko/20100101Firefox/4.0.1"}
#                    ]
#         self.header = random.choice(headers)
#     def daili(self):
#
#         url1='http://www.89ip.cn/index_{}.html'
#         for pages in range(1,2):
#             url=url1.format(pages)
#             response=requests.get(url=url,headers=self.header).text
#             data=etree.HTML(response)
#             ip=data.xpath('//tr/td[1]/text()')
#             duankou=data.xpath('//tr/td[2]/text()')
#             ip_list=[]
#             for a in range(0,len(ip)):
#                 proxy=ip[a].strip()+':'+duankou[a].strip()
#                 ip_list.append(proxy)
#             return ip_list
#
#     #验证http可用性
#     def http(self,url):
#         ip_list=self.daili()
#         http_list=[]
#         for proxy0 in ip_list:
#             proxy={}
#             proxy['http']=proxy0
#             try:
#                 response=requests.get(url,proxies=proxy,headers=self.header,timeout=3)
#             except Exception:
#                 print(proxy,"不可用")
#             else:
#                 http_list.append(proxy)
#         return http_list
#     #验证https可用性
#     def https(self,url):
#         ip_list=self.daili()
#         https_list=[]
#         for proxy0 in ip_list:
#             proxy={}
#             proxy['https']=proxy0
#             try:
#                 response=requests.get(url,headers=self.header,proxies=proxy,timeout=3)
#             except Exception:pass
#                 #print(proxy,"不可用")
#             else:
#                 https_list.append(proxy)
#         return https_list
# http=Bajiudaili().http('https://www.a6ksw.com/book/91503/')
# https=Bajiudaili().https('https://www.a6ksw.com/book/91503/')
# if len(http) >5:
#     proxy=http
# elif len(https) >5:
#     proxy=https
# else:pass
# UA_list = [
#             "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
#             "Mozilla/5.0(compatible;MSIE9.0;WindowsNT6.1;Trident / 5.0",
#             "Mozilla/4.0(compatible;MSIE8.0;WindowsNT6.0;Trident/4.0)",
#             "Mozilla/4.0(compatible;MSIE7.0;WindowsNT5.1;360SE)",
#             "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0",
#             "Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1",
#             "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Safari/537.36",
#             "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
#             "Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.0; U; en-US) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/233.70 Safari/534.6 TouchPad/1.0",
#             "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
#             "Mozilla/5.0(Macintosh;IntelMacOSX10.6;rv:2.0.1)Gecko/20100101Firefox/4.0.1"]
#
# l=['https://www.a6ksw.com/book/27745/',
#    'https://www.a6ksw.com/book/28171/',
#    'https://www.a6ksw.com/book/91503/',
#    'https://www.a6ksw.com/book/85845/',
#    'https://www.a6ksw.com/book/88932/',
#    'https://www.a6ksw.com/book/94994/',
#    'https://www.a6ksw.com/book/93021/']
# n=0
# while n<1:
#     for url in l:
#         try:
#             a=requests.get(url,
#                            headers={
#                                "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
#                                "Accept-Language":"zh-CN,zh;q=0.9",
#                                "User_Agent":random.choice(UA_list),
#                                },
#                            proxies=random.choice(http),
#                            timeout=10).content.decode()
#             b=etree.HTML(a)
#             title_list=b.xpath("//div[@id='list']//dd[position()>12]/a/text()")
#             url_list=b.xpath("//div[@id='list']//dd[position()>12]/a/@href")
#             print(title_list)
#             if len(title_list)<1:
#                 open('caogao.txt', 'a', encoding='utf-8').write(url + ' zhuye \n')
#             for url in url_list[-3:]:
#                 a1=requests.get('https://www.a6ksw.com'+url,headers={ "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9","Accept-Language":"zh-CN,zh;q=0.9","User_Agent":random.choice(UA_list)},verify=False,timeout=10,proxies=random.choice(http)).content.decode()
#                 b1=etree.HTML(a1)
#                 c1=b1.xpath("//div[@id='content']/text()")
#                 print(c1)
#                 if len(c1) <1 :
#                     open('caogao.txt', 'a', encoding='utf-8').write(url + ' zhangjieye \n')
#         except Exception as e:
#             print(e)#
#             open('caogao.txt','a',encoding='utf-8').write(str(e)+'\n')
#         n+=1





