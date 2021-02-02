# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class Info(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    name=scrapy.Field()
    author=scrapy.Field()
    last_time=scrapy.Field()
    intro=scrapy.Field()
    cate=scrapy.Field()
    img_url=scrapy.Field()
    home_url = scrapy.Field()
    chapter_title_list=scrapy.Field()
    chapter_url_list=scrapy.Field()
    index_name=scrapy.Field()
    element=scrapy.Field()
class Chapter(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    chapter_num=scrapy.Field()
    chapter_title=scrapy.Field()
    chapter_content=scrapy.Field()
    name=scrapy.Field()
    author = scrapy.Field()