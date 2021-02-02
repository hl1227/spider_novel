import requests,time,urllib3,random,pymysql
from lxml import etree
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# num=0
# while num <10:
#     try:
#         a=requests.get('http://www.biquge.info/').content.decode()
#         b=etree.HTML(a)
#         c=b.xpath('//div[@class="l"]//span[@class="s2"]/a/@href')
#         for url in c:
#             a1=requests.get(url).content.decode()
#             b1=etree.HTML(a1)
#             url_list=b1.xpath('//div[@id="list"]//a/@href')
#             if len(url_list)<1:
#                 open('ceshi.txt','a',encoding='utf-8').write(url+'\n')
#                 continue
#             for url1 in url_list:
#                 cha_url=url+url1
#                 a2=requests.get(cha_url)
#                 if a2.status_code == 200:print(cha_url,'获取成功')
#                 else:open('ceshi.txt','a',encoding='utf-8').write(cha_url+'\n')
#     except Exception as e:
#         open('ceshi.txt', 'a', encoding='utf-8').write(str(e) + '\n')
#         continue
#     num+=1

#------------------------------------------------------------------------------------
# s_t=time.time()

# for num in range(2,9):
#     url = 'https://www.qb5.tw/list/{}.html'.format(num)
#     try:
#         a=requests.get(url).content.decode('gbk')
#         b=etree.HTML(a)
#         c=b.xpath('//div[@id="tlist"]//div[@class="zp"]/a/@href')
#         for url in c[0:16]:
#             print(url)
#             open('ceshi_qb5.txt','a').write(url+'\n')
#         # for url in c:
#         #     a1=requests.get('https://www.booktxt.com'+url).content.decode('gbk')
#         #     b1=etree.HTML(a1)
#         #     #print(a1)
#         #     url_list=b1.xpath('//div[@id="list"]//a/@href')
#         #     if len(url_list)<1:
#         #         open('ceshi.txt','a',encoding='utf-8').write(url+'\n')
#         #         continue
#         #     for url1 in url_list:
#         #         cha_url='https://www.booktxt.com'+url1
#         #         a2=requests.get(cha_url)
#         #         if a2.status_code == 200:print(cha_url,'获取成功')
#         #         else:open('ceshi.txt','a',encoding='utf-8').write(cha_url+'  状态码: '+str(a2.status_code)+'\n')
#         #         print('运行:',(time.time()-s_t)/60,'分钟')
#     except Exception as e:
#         open('ceshi.txt', 'a', encoding='utf-8').write(str(e) + '\n')
#         continue
#     num+=1
# e_t=time.time()
# when_time=(e_t-s_t) / 60
# open('ceshi.txt','a',encoding='utf-8').write(str(float('%.2f' %when_time))+'\n')
#-------随机排序URL-----------------------------------------------------------------
url_txt_name="热门小说8.18.txt"
def url_num():
    f = open(url_txt_name,'r').readlines()
    random.shuffle(f)
    q=open('add_hot_novel0818.txt', 'w', encoding='utf-8')
    for u in f:
      q.write(u)
#url_num()

#------------------------------------------------------
from config import sql_config
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


find_tables="show tables from {}".format(sql_date["db"])
cur.execute(find_tables)

source_dbname='b_source_list_6'
# for db_name in cur.fetchall():
#     if source_dbname in db_name[0]:
#         pass
#     else:
add_source_db='''
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


