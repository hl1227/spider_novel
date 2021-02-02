

def sql_config():
    sql_date={
                "host":"localhost",      #域名
                "port":3306,             #端口
                "user":"root",           #用户名
                "passwd":"66884747",     #密码
                "db":"newceshi",             #库名
                "charset":"utf8"         #编码
                }
    # sql_date={
    #             "host":"47.108.147.195",      #域名
    #             "port":3306,             #端口
    #             "user":"book",           #用户名
    #             "passwd":"xsb_123456",     #密码
    #             "db":"book",             #库名
    #             "charset":"utf8"         #编码
    #             }
    # sql_date={
    #             "host":"118.24.184.149",      #域名
    #             "port":3306,             #端口
    #             "user":"282756287",           #用户名
    #             "passwd":"c282756287",     #密码
    #             "db":"book01",             #库名
    #             "charset":"utf8"         #编码
    #             }
    return sql_date

def path_config():    #路径 结尾必须为: /upload/novel_img/  或  /upload/chapter_txt/
    img_path=r'upload/novel_img/'      #举例:  r'C:/Users/XXX/Desktop/upload/novel_img/'
    txt_path=r'upload/chapter_txt/'      #举例:  r'C:/Users/XXX/Desktop/upload/chapter_txt/'
    return img_path,txt_path

url_txt_name='url.txt'
#################下面不要动!!!#######################################
def url_list():
    url_list=[]
    start_f=open('start_num.txt','r').readlines()
    start_num=int(start_f[-1])
    f=open(url_txt_name,'r').readlines()
    url=f[start_num].replace('\n','')
    url_list.append(url)
    return url_list
def url_num():
    f = open(url_txt_name,'r').readlines()
    return len(f)
#print(url_num())