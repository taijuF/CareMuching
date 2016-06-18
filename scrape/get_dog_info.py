from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support import expected_conditions as EC
from progressbar import ProgressBar
from string import Template

from bs4 import BeautifulSoup
import urllib.request
import re
import json

import time
import shutil
import os
import re
import sys
import json
import re

from PIL import Image

ERROR   = False
SUCCESS = True

# 簡易情報を取得する
# 詳細情報を取得する
# 次のページにすすむ
# 繰り返し
#def get_instance_dog_info():
    
def go_next_page(current_page):
    next_page = str(current_page + 1)
    browser.get("http://www.pet-home.jp/center/dogs/page" + next_page + '/')
    try:
        test = browser.find_element_by_xpath('//*[@id="searchpanel"]/div[2]/ul/li[2]')
    except:
        # エラーページが無い時
        return 'SUCCESS'
    return 'ERROR'

def access_deitals_dog_pages():
    dogs_data = []
    for i in range(27):
        browser.find_element_by_xpath('//*[@id="follow_scrolling_container"]/div[1]/ul/li[' + str(i + 1) + ']/div').click()
        dogs_data.append(get_details_dog_info())
        browser.back()

def find_element_text(xpath):
    try:
        result = browser.find_element_by_xpath(xpath).text
    except:
        return ''
    return result

def find_element_attribute(xpath, attribute):
    try:
        result = browser.find_element_by_xpath(xpath).get_attribute(attribute)
    except:
        return ''
    return result

def get_details_dog_info():
    dogs_info = {}
    dogs_info['facility']        = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[1]')
    dogs_info['image']           = find_element_attribute('//*[@id="contribute_head_content"]/div/div[1]/div/div[1]/div[1]/a/img',"src")
    dogs_info['title']           = find_element_text('//*[@id="contribute_head_content"]/div/div[1]/h3')
    dogs_info['age']             = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[4]/a')
    dogs_info['size']            = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[6]/a')
    dogs_info['castration']      = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[8]')
    dogs_info['can_senior']      = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[10]')
    dogs_info['can_single']      = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[9]')
    dogs_info['breed']           = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[3]/a')
    dogs_info['sex']             = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[5]/a')
    dogs_info['vaccine']         = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[7]')
    dogs_info['story']           = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/div[2]/div/p')
    dogs_info['personality']     = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/div[3]/div/p')
    dogs_info['health']          = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/div[4]/div/p')
    dogs_info['delivery_method'] = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/div[5]/div/p')
    dogs_info['other']           = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/div[6]/div/p')
    dogs_info['limit']           = find_element_text('//*[@id="contribute_head_content"]/div/div[1]/ul[1]/li[2]')
    #dogs_info['cost']            = browser.find_element_by_xpath('//*[@id="contribute_detail_wrap"]/div[2]/div[2]/table/tbody/tr[3]/td').text
    dogs_info['location']        = find_element_text('//*[@id="contribute_detail_wrap"]/div[1]/dl/dd[2]/a')
    print(dogs_info)
    return dogs_info

if __name__ == '__main__':
    global browser
    case = 1
    if(case == 0):
        dcap = dict(DesiredCapabilities.PHANTOMJS)
        dcap["phantomjs.page.settings.userAgent"] = (
           "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/53 "
           "(KHTML, like Gecko) Chrome/15.0.87"
        )
        browser = webdriver.PhantomJS(desired_capabilities=dcap, service_args=['--cookies-file=/tmp/ph_cook.txt'])
    else:
        browser = webdriver.Firefox()
    browser.implicitly_wait(5) 
    browser.maximize_window()

    result = {} # 最終結果
    # ページ毎の処理
    page = 1
    can_turn_page = go_next_page(page)
    dogs_data = []
    while can_turn_page == 'SUCCESS':
        for i in range(27):
            browser.find_element_by_xpath('//*[@id="follow_scrolling_container"]/div[1]/ul/li[' + str(i + 1) + ']/div').click()
            dogs_data.append(get_details_dog_info())
            with open('dogs_data.json', 'w+', encoding='utf-8') as fp:
                json.dump(dogs_data, fp, indent=2, ensure_ascii=False)
            browser.back()
        access_deitals_dog_pages()
        page += 1
        can_turn_page = go_next_page(page)
        print(can_turn_page)

    time.sleep(10000)




