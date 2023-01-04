#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 24 14:57:14 2022

@author: jacob
"""



from Crawler.Process import *


table_name = 'price'
crawl_function = crawl_price



def AutoCrawler(table_name, crawl_function):
    # first_date, last_date = table_date_range(table_name)
    last_date = table_date_range(table_name) + datetime.timedelta(days=1)
    dates = date_range(last_date, datetime.datetime.now())
    
    update_table(table_name, crawl_function, dates)




if __name__ == "__main__":
    AutoCrawler(table_name, crawl_price)
