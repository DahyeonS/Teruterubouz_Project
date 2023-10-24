# -*- coding: utf-8 -*-
# 기온 데이터 처리

import pandas as pd
import json

data = pd.read_csv("D:/kdigital2307/github/Teruterubouz_Project/python/기상청데이터_기온.csv").iloc[:, [2, 3, 4, 5, 7, 8]]

def info(): 
    avg_temp = round(data.groupby(data['일시'].str[5:7]).mean()['평균기온(℃)'], 1)
    max_temp = data.groupby(data['일시'].str[5:7]).max()['평균최고기온(℃)']
    min_temp = data.groupby(data['일시'].str[5:7]).min()['평균최저기온(℃)']
    
    result = pd.DataFrame({'평균기온':avg_temp, '평균최고기온':max_temp, '평균최저기온':min_temp})
    return result

def month(): 
    result = data.copy().iloc[: , [0, 1, 3, 5]]
    result['일시'] = result['일시'].str[5:7]
    
    return result

def temp_info():
    df = info()
    data = []
    
    for i in range(df.shape[0]) :
        item = {}
        item['month'] = int(df.index[i])
        item['avg'] =  df.iloc[i, 0]
        item['max'] = df.iloc[i, 1]
        item['min'] = df.iloc[i, 2]
        data.append(item)
        result = json.dumps(data)
        
    return result