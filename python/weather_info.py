# -*- coding: utf-8 -*-
# 날씨 데이터 조회
import pandas as pd
import requests
import warnings
import json

warnings.filterwarnings('ignore')

col_name = ['REG_ID', 'TM_FC', 'TM_EF', 'MOD', 'NE', 'STN', 'C', 'MAN_ID', 'MAN_FC', 'W1', 'T', 'W2', 'TA', 'ST', 'SKY', 'PREP']

def weather_crawling(reg) :
    url = 'https://apihub.kma.go.kr/api/typ01/url/fct_afs_dl.php'
    key = 'KAZL23c3Q2yGS9t3N-Nskw'
    params = {'reg': reg,
             'tmfc1': '',
             'tmfc2': '',
             'disp': 0,
             'help': 0,
             'authKey': key}
    response = requests.get(url, params=params, verify=False)
    
    text = response.text
    text = text.split('\n')[4:-2]
    
    df = pd.DataFrame(text)[0].str.split(expand=True).iloc[:, :16]
    df.columns = col_name
    return df

def weather(reg):
    df = weather_crawling(reg)
    data = []
    
    for i in range(df.shape[0]) :
        item = {}
        item['date'] =  df.iloc[i, 2]
        item['prob'] = df.iloc[i, -3]
        item['sky'] = df.iloc[i, -2]
        item['rain'] = df.iloc[i, -1]
        data.append(item)
        result = json.dumps(data)
        
    return result