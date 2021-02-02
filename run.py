import requests,time,os
from config import url_num
from datetime import datetime
from update_novel import Update_chapter,Update_source,find_err
def network_status():
    try:
        res=requests.get('https://www.baidu.com/',timeout=5)
        if res.status_code != 200:
            print('状态码错误')
            time.sleep(300)
            network_status()
    except Exception:
        print('网络请求失败,请修复网络!!,不用关闭此程序!!')
        time.sleep(300)
        network_status()

f1=open('start_num.txt','r').readlines()
url_list_num = int(f1[-1])
end_num=url_num()

while url_list_num < end_num:
    network_status()
    f = open('start_num.txt','w')
    f.write(str(url_list_num))
    f.close()
    time.sleep(1)
    os.system("scrapy crawl aa")
    print('第',url_list_num+1,'本小说,爬取完毕!!!')
    url_list_num+=1

    if datetime.now().hour == 3:
        find_err().set_is_lianzai()
        time.sleep(60)
        try:Update_chapter().run(8)
        except Exception as e:
            open('update_novel.log','a', encoding='utf-8').write('**重大错误:'+str(datetime.now()+'章节更新报错'+str(e)))
        time.sleep(300)
        try:Update_source().sql_date(8)
        except Exception as e:
            open('update_novel.log','a', encoding='utf-8').write('**重大错误:'+str(datetime.now()+'换源更新报错'+str(e)))
print('-----------------爬取结束----------------------')