# -*- coding: utf-8 -*-
import scrapy,pymysql,re,time,scrapy.downloadermiddlewares.retry
from xs1t.items import Info,Chapter
from xpinyin import Pinyin
from config import url_list

class XiaoshuoSpider(scrapy.Spider):
    name = 'aa'
    allowed_domains = ['dingdiann.com','a6ksw.com','biqiuge.com','xbiquge.la','ddsk.la','7kzw.com','mhtwx.la','qiquxiaoshuo.com','qb5.tw','booktxt.com']
    start_urls =url_list()
    def parse(self, response):
        item = Info()
        if response.status >= 200 and response.status <=400:
            if 'dingdiann' in response.url:
                #章节URL + https://www.dingdiann.com
                type3_xpath = {"name_xpath": "//meta[@property='og:title']/@content",
                               "auth_xpath":"//meta[@property='og:novel:author']/@content",
                               "cate_xpath":"//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath":"//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   :"//meta[@property='og:description']/@content",
                               "imgurl_xpath"  :"//meta[@property='og:image']/@content",
                               "title_xpath"   :"//div[@id='list']//dd[position()>12]/a/text()",
                               "chapter_xpath" :"//div[@id='list']//dd[position()>12]/a/@href"}
                type4_xpath={"title_xpath":"//div[@class='bookname']/h1/text()",
                             "content_xpath":"//div[@id='content']/text()"}
                chapter_delete=['小美~正在手打中，请稍等片刻，内容更新后，需要重新刷新页面，才能获取最新更新！','纯文字在线阅读本站域名手机同步阅读请访问','章节错误,点此举报(免注册)',',举报后维护人员会在两分钟内校正章节内容,请耐心等待,并刷新页面。','|　|　　->　->',
                                '最新网址：www.ddxsku.com','Ｅ』┡　小说Ｗｗ','看完记得：方便下次看，或者。','最新全本：、、、、、、、、、、','：。：','天才一秒记住本站地址:(顶点中文)www.ddsk.la,最快更新!无广告!',
                                '推荐都市大神老施新书:'
                                ]
                index_name='顶点小说'
                element='#content'
                pinjie_url='https://www.dingdiann.com'
            elif 'a6ksw' in response.url:
                #封面+https://www.a6ksw.com
                #章节URL+ https://www.a6ksw.com
                type3_xpath = {"name_xpath": "//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath":"//meta[@property='og:novel:author']/@content",
                               "cate_xpath":"//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath":"//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   :"//meta[@property='og:description']/@content",
                               "imgurl_xpath"  :"//meta[@property='og:image']/@content",
                               "title_xpath"   :"//div[@id='list']//dd[position()>12]/a/text()",
                               "chapter_xpath" :"//div[@id='list']//dd[position()>12]/a/@href"}
                chapter_delete=['天才一秒记住本站地址：[爱豆看书]','https://www.a6ksw.com/最快更新！无广告！','正在手打更新中，敬请期待。','章节错误,点此报送(免注册)','报送后维护人员会在两分钟内校正章节内容,请耐心等待。']
                type4_xpath={"title_xpath":"//div[@class='bookname']/h1/text()",
                             "content_xpath":"//div[@id='content']/text()"}
                index_name='爱豆看书'
                pinjie_url ='https://www.a6ksw.com'
                element = '#content'
            elif 'biqiuge.com' in response.url:
                # 章节URL + https://www.biqiuge.com/
                type3_xpath = {"name_xpath":"//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath":"//meta[@property='og:novel:author']/@content",
                               "cate_xpath":"//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath":"//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   :"//meta[@property='og:description']/@content",
                               "imgurl_xpath"  :"//meta[@property='og:image']/@content",
                               "title_xpath"   :"//div[@class='listmain']//dd[position()>6]/a/text()",
                               "chapter_xpath" :"//div[@class='listmain']//dd[position()>6]/a/@href"}
                type4_xpath={"title_xpath":"//div[@class='content']/h1/text()",
                             "content_xpath":"//div[@id='content']/text()"}
                chapter_delete =[response.url,'请记住本书首发域名：biqiuge.com。笔趣阁手机版阅读网址：wap.biqiuge.com']
                pinjie_url= 'https://www.biqiuge.com'
                index_name = '笔糗阁'
                element = '#content'
            elif 'xbiquge.la' in response.url:
                #last time [5:-1]
                #章节URL +  http://www.xbiquge.la
                type3_xpath ={"name_xpath" :"//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath":"//meta[@property='og:novel:author']/@content",
                               "cate_xpath":"//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath":"//div[@id='info']/p[3]/text()",
                               "intro_xpath"   :"//meta[@property='og:description']/@content",
                               "imgurl_xpath"  :"//meta[@property='og:image']/@content",
                               "title_xpath"   :"//div[@id='list']//dd/a/text()",
                               "chapter_xpath" :"//div[@id='list']//dd/a/@href"}
                type4_xpath={"title_xpath":"//div[@class='bookname']/h1/text()",
                             "content_xpath":"//div[@id='content']/text()"}
                chapter_delete =['xbiquge.la',' 新笔趣阁','内容更新后，请重新刷新页面，即可获取最新更新！','正在手打中，请稍等片刻，','纯文字在线阅读本站域名']
                pinjie_url='http://www.xbiquge.la'
                index_name = '新笔趣阁'
                element = '#content'
            elif '7kzw.com' in response.url:
                #封面 URL+ https://www.7kzw.com
                #章节URL +  https://www.7kzw.com
                type3_xpath ={"name_xpath" :"//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath":"//meta[@property='og:novel:author']/@content",
                               "cate_xpath":"//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath":"//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   :"//meta[@property='og:description']/@content",
                               "imgurl_xpath"  :"//meta[@property='og:image']/@content",
                               "title_xpath"   :"//div[@id='list']//dd[position()>12]/a/text()",
                               "chapter_xpath" :"//div[@id='list']//dd[position()>12]/a/@href"}
                type4_xpath={"title_xpath":"//div[@class='bookname']/h1/text()",
                             "content_xpath":"//div[@id='content']/text()"}
                chapter_delete =['天才一秒记住本站地址：[奇快中文网]','https://www.7kzw.com/最快更新！无广告！']
                pinjie_url ='https://www.7kzw.com'
                index_name = '奇快中文'
                element = '#content'
            elif 'ddsk.la' in response.url or 'dingdiansk' in response.url:
                #章节URL + http://www.dingdiansk.com
                type3_xpath = {"name_xpath":"//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath":"//meta[@property='og:novel:author']/@content",
                               "cate_xpath":"//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath":"//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   :"//meta[@property='og:description']/@content",
                               "imgurl_xpath"  :"//meta[@property='og:image']/@content",
                               "title_xpath"   :"//table[@id='bgdiv']//div[@class='dccss']/a/text()",
                               "chapter_xpath" :"//table[@id='bgdiv']//div[@class='dccss']/a/@href"}
                type4_xpath={"title_xpath":"//h2//text()",
                             "content_xpath":"//div[@id='content']/text()"}
                chapter_delete =['天才一秒记住本站地址:(顶点中文)www.ddsk.la,最快更新!无广告!','小美~正在手打中，请稍等片刻，内容更新后，需要重新刷新页面，才能获取最新更新！','顶点中文全文字更新,牢记网址:www.ddsk.la','顶点中文','www.ddsk.la','手机用户请浏览阅读，更优质的阅读体验。']
                pinjie_url ='http://www.ddsk.la'
                index_name='顶点中文'
                element = '#content'
            elif 'mhtwx.la' in response.url:
                type3_xpath = {"name_xpath": "//meta[@name='og:novel:book_name']/@content",
                               "auth_xpath": "//meta[@name='og:novel:author']/@content",
                               "cate_xpath": "//meta[@name='og:novel:category']/@content",
                               "lasttime_xpath": "//meta[@name='og:novel:update_time']/@content",
                               "intro_xpath"   : "//p[@id='intro']/text()",
                               "imgurl_xpath"  : "//meta[@property='og:image']/@content",
                               "title_xpath"   : "//div[@class='novel_list']/dl/dd/a/text()",
                               "chapter_xpath" : "//div[@class='novel_list']/dl/dd/a/@href",
                               "keywords_xpath":"//meta[@name='keywords']/@content"}
                type4_xpath = {"title_xpath": "//div[@class='read_title']/h1/text()",
                               "content_xpath": "//div[@class='content']/text()"}
                chapter_delete = ['最新网址：www.mhtwx.la','c_t();','内容更新后，请重新刷新页面，即可获取最新更新！','正在手打中，请稍等片刻，','一秒记住【棉花糖小说网www.mhtwx.la】，为您提供精彩小说阅读。','手机用户可访问wap.mhtwx.la观看小说，跟官网同步更新．']
                pinjie_url = response.url
                index_name = '棉花糖小说网'
                element = '*content'
            elif 'qb5.tw' in response.url:
                type3_xpath = {"name_xpath": "//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath": "//meta[@property='og:novel:author']/@content",
                               "cate_xpath": "//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath": "//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   : "//meta[@property='og:description']/@content",
                               "imgurl_xpath"  : "//meta[@property='og:image']/@content",
                               "title_xpath"   : "//div[@class='zjbox']/dl/dd/a/text()",
                               "chapter_xpath" : "//div[@class='zjbox']/dl/dd/a/@href",
                               "keywords_xpath":"//meta[@name='keywords']/@content"}
                type4_xpath = {"title_xpath": "//div[@id='main']/h1/text()",
                               "content_xpath": "//div[@id='content']/text()"}
                chapter_delete = ['全本小说网 WWW.QB5.TW，最快更新','最新章节！','一秒记住【??】，為您提供精彩小说阅读。']
                pinjie_url = 'https://www.qb5.tw/'
                index_name = '全本小说网'
                element = '#content'
            elif 'booktxt.com' in response.url:
                type3_xpath = {"name_xpath": "//meta[@property='og:novel:book_name']/@content",
                               "auth_xpath": "//meta[@property='og:novel:author']/@content",
                               "cate_xpath": "//meta[@property='og:novel:category']/@content",
                               "lasttime_xpath": "//meta[@property='og:novel:update_time']/@content",
                               "intro_xpath"   : "//meta[@property='og:description']/@content",
                               "imgurl_xpath"  : "//meta[@property='og:image']/@content",
                               "title_xpath"   : "//div[@id='list']//dd/a/text()",
                               "chapter_xpath" : "//div[@id='list']//dd/a/@href"}
                type4_xpath = {"title_xpath"   : "//div[@class='bookname']/h1/text()",
                               "content_xpath" : "//div[@id='content']/text()"}
                chapter_delete = ['booktxt.com', '顶点小说']
                pinjie_url = 'https://www.booktxt.com'
                index_name = '顶点book'
                element = '#content'
            # elif 'qiquxiaoshuo' in response.url:
            #     type3_xpath = {"name_xpath": "//meta[@property='og:novel:book_name']/@content",
            #                    "auth_xpath": "//meta[@property='og:novel:author']/@content",
            #                    "cate_xpath": "//meta[@property='og:novel:category']/@content",
            #                    "lasttime_xpath": "//meta[@property='og:novel:update_time']/@content",
            #                    "intro_xpath": "//meta[@property='og:description']/@content",
            #                    "imgurl_xpath": "//meta[@property='og:image']/@content",
            #                    "title_xpath": "//div[@class='article_texttitleb']//li/a/text()",
            #                    "chapter_xpath": "//div[@class='article_texttitleb']//li/a/@href"}
            #     type4_xpath = {"title_xpath": "//h1//text()",
            #                    "content_xpath": "//div[@id='book_text']//text()"}
            #     chapter_delete = ['奇趣小说', 'www.qiquxiaoshuo.com',' 请稍后，正在更新。。。']
            #     pinjie_url = ''
            #     index_name = '奇趣小说'
            #     element = '#book_text'
            else:pass
            try:
                # print('#######',response.url,response.xpath(type3_xpath["name_xpath"]).extract_first())
                item["name"]=response.xpath(type3_xpath["name_xpath"]).extract_first().strip()
                item["author"]=response.xpath(type3_xpath["auth_xpath"]).extract_first().strip()
                #更新时间判断
                if 'xbiquge.la' in response.url:
                    item["last_time"] = response.xpath(type3_xpath["lasttime_xpath"]).extract_first().strip()[5:15]
                else:
                    item["last_time"]=response.xpath(type3_xpath["lasttime_xpath"]).extract_first().strip()[0:10]
                #简介
                intro=response.xpath(type3_xpath["intro_xpath"]).extract_first()
                if intro is None or len(intro) <= 10:
                    item["intro"] ="欢迎使用小说宝免费阅读神器，全网最优质资源，及时更新。如果您觉得不错，请向身边的朋友推荐分享，谢谢！"
                else:
                    item["intro"]=intro.strip().replace('<br/>','').replace('</b>','')
                #封面URL判断
                if '7kzw.com' in response.url or 'a6ksw.com' in response.url:
                    item["img_url"] =pinjie_url +response.xpath(type3_xpath["imgurl_xpath"]).extract_first().strip().replace('\n','')
                else:
                    item["img_url"]=response.xpath(type3_xpath["imgurl_xpath"]).extract_first().strip()
                item["cate"]=response.xpath(type3_xpath["cate_xpath"]).extract_first().strip()
                item["home_url"] = response.url
                item["chapter_url_list"]=[pinjie_url + url for url in response.xpath(type3_xpath["chapter_xpath"]).extract()]
                page = len(item["chapter_url_list"])
                weigui_list = ["军婚", "军嫂", "军政", "高干", "党中央", "黑道", "黑帮", "校霸", "做爱", "爱爱", "很疼", "打炮", "约炮",
                               "野合", "口交", "乳交", "肛交", "爆菊花","手淫", "打飞机", "一夜情", "女上男下", "身下承欢", "胯下承欢",
                               "活在裆下", "轻点喘", "师生恋", "兄妹恋", "掰弯", "同性恋", "搞基", "妓院", "嫖客", "处女", "强奸", "乱伦", "迷奸", "艹我",
                               "老公我还要", "睡服你", "狗日", "皇权富贵", "农坤", "杰佣", "凯源", "凯千", "勋鹿", "张云雷杨九郎", "魔道祖师", "天官赐福",
                               "自杀", "共产党", "血腥", "你妈","尼玛","草泥马","曹尼玛"]
                item["chapter_title_list"] = []
                for res_title in response.xpath(type3_xpath["title_xpath"]).extract():
                    for weigui in weigui_list:
                        if weigui in res_title:
                            res_title = res_title.replace(weigui, Pinyin().get_pinyin(weigui, ''))
                        res_title = res_title.replace("'", "").replace('"', '').replace('\n', '').replace('\\','').replace('	', '').replace('SM','').replace('AV','').replace('GV','')
                    item["chapter_title_list"].append(res_title)

                item["index_name"]=index_name
                item["element"]=element
                save_sql = True
                if page < 20 and time.time()-int(time.mktime(time.strptime(item["last_time"], "%Y-%m-%d"))) >31536000:
                    print(item["name"],'章节数异常,放弃抓取!!')
                    save_sql=False

                for weigui in weigui_list:
                    if weigui in item["name"]:
                        print(item["name"],'小说名违规,放弃抓取!!')
                        open('err.txt', 'a', encoding='utf-8').write(+'小说名违规,放弃抓取:'+item["name"]+response.url)
                        save_sql=False

                if save_sql == True:
                    yield item
                    for num in range(0,page):
                        yield scrapy.Request(response.urljoin(item["chapter_url_list"][num]), callback=self.info,meta={"chapter_title_list": item["chapter_title_list"],"type4_xpath": type4_xpath, "chapter_delete": chapter_delete,"num": num, "author": item["author"], "name": item["name"]})
                else:self.crawler.engine.close_spider(self)
            except Exception as e:
                open('err.txt', 'a', encoding='utf-8').write('***主页解析错误:' + response.url + str(e)+'\n')
                self.crawler.engine.close_spider(self)
        elif response.status >= 400:
            open('err.txt', 'a', encoding='utf-8').write('***主页状态错误:' + response.url +'  状态码:'+ str(response.status)+'\n')
            self.crawler.engine.close_spider(self)
    def info(self,response):
        item=Chapter()
        num = response.meta["num"]
        item["name"] = response.meta["name"]
        item["author"] = response.meta["author"]
        item["chapter_num"] = num + 1
        item["chapter_title"] = response.meta["chapter_title_list"][num]
        if response.status >= 200 and response.status <=300:
            try:
                content=response.xpath(response.meta["type4_xpath"]["content_xpath"]).extract()
                t = ''
                for txt in content:
                    # if 'qiquxiaoshuo' in response.url and 'qiquxiaoshuo' in txt.lower():
                    #     t += ' ' + txt.strip().replace('\n', '')[0:-26] + '\n'
                    # else:
                    t += ' ' + txt.strip().replace('\n','') + '\n'
                for delete in response.meta["chapter_delete"]:
                    t = t.replace(response.url,'').replace(delete,'').replace(item["name"],'')
                t = re.compile('<[^>]+>', re.S).sub('', t)
                item["chapter_content"]=t
                yield item
            except Exception:
                item["chapter_content"] = ''
                open('err.txt','a', encoding='utf-8').write('***分页解析错误:' + response.url + '\n')
                yield item
        elif response.status >=400:
            item["chapter_content"] = ''
            open('err.txt', 'a', encoding='utf-8').write('***分页状态错误:' + response.url +'  状态码:'+str(response.status)+'\n')
            yield item