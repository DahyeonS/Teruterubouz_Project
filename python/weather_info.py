# -*- coding: utf-8 -*-
import pandas as pd
import requests
from datetime import datetime, timedelta
import warnings

warnings.filterwarnings('ignore')

col_name = ['REG_ID', 'TM_FC', 'TM_EF', 'MOD', 'NE', 'STN', 'C', 'MAN_ID', 'MAN_FC', 'W1', 'T', 'W2', 'TA', 'ST', 'SKY', 'PREP', 'WF']

def weather(reg) :
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
    
    df = pd.DataFrame(text)[0].str.split(expand=True)
    for i in range(df.shape[0]) :
        if df.iloc[i,17] != None :
            df.iloc[i,16] = df.iloc[i,16] + " " + df.iloc[i,17]
            if df.iloc[i,18] != None : 
                df.iloc[i,16] = df.iloc[i,16] + " " + df.iloc[i,18]
    df = df.iloc[:,:-2]
    df.columns = col_name
    return df

reg = '11B10101' # 서울
print(weather(reg))
