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

def main():
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
    browser.implicitly_wait(10) 

    browser.maximize_window()
    browser.get("http://www.muji.net/shop/")
    browser.find_element_by_xpath('//*[@id="searchpanel"]/div[2]/ul/li[2]').click()

    shop = []
    #for i in range(2, 49):
    for i in range(2, 49):
        browser.find_element_by_xpath('//*[@id="s2id_prefectures"]/a/span[1]').click()
        browser.find_element_by_xpath('//*[@id="select2-drop"]/ul/li[' + str(i) + ']/div').click()
        page_source = browser.page_source
        #with open('test.html', 'w+') as fp:
        #    fp.write(browser.page_source)
        #browser.save_screenshot("kakunin.png")
        #with open('test.html', 'r+') as fp:
        #    page_source = fp.read()
        print(i - 1)
        
        shopname = re.findall(r'<div class="shopname">.+?</div>', page_source)
        address = re.findall(r'<div class="shopaddress">.+?</div>', page_source)
        for i in range(len(shopname)):
            print('i:' + str(i) + ":" + shopname[i][22:-6])
            shop_temp = {}
            shop_temp['shopname'] = shopname[i][22:-6]
            shop_temp['address'] = address[i][25:-6]
            shop_temp['location'] = getgeo(shopname[i][22:-6])
            shop_temp['appname'] = 'mujirusi'
            if shop_temp['location'] == None:
                continue
            shop.append(shop_temp)

    result = {}
    result['results'] = shop

    with open('mujirusi.json', 'w+', encoding='utf-8') as fp:
        json.dump(result, fp, indent=2, ensure_ascii=False)

def getgeo(adr):
    url = 'https://maps.googleapis.com/maps/api/geocode/json?'
    params = urllib.parse.urlencode({
        'address': adr,
    })
    try:
        response = urllib.request.urlopen(url + params)
        json_body = json.loads(response.read().decode('utf-8'))
        location = json_body['results'][0]['geometry']['location']
        location["__type"] = "GeoPoint"
        location["latitude"] = location['lat']
        location["longitude"] = location['lng']
        del(location['lat'])
        del(location['lng'])
        return(location)
    except:
        return(None)

if __name__ == '__main__':
    main()


