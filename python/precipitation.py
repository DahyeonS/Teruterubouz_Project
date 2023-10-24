# -*- coding: utf-8 -*-
# 기온 데이터 처리

import pandas as pd
import json

data = pd.read_csv("D:/kdigital2307/github/Teruterubouz_Project/python/기상청데이터_강수.csv").iloc[:, [2, 3, 4, 6]]

def year_info():
    avg_rain = round(data.groupby(data['일시'].str[:4]).mean()['평균일강수량(mm)'], 1)[:-1]
    max_rain = data.groupby(data['일시'].str[:4]).max()['최다일강수량(mm)'][:-1]
    hour_rain = data.groupby(data['일시'].str[:4]).max()['1시간최다강수량(mm)'][:-1]
    
    result = pd.DataFrame({'평균일강수량':avg_rain, '최다일강수량':max_rain, '1시간최다강수량':hour_rain})
    return result

def month_info(): 
    avg_rain = round(data.groupby(data['일시'].str[5:7]).mean()['평균일강수량(mm)'], 1)
    max_rain = data.groupby(data['일시'].str[5:7]).max()['최다일강수량(mm)']
    hour_rain = data.groupby(data['일시'].str[5:7]).max()['1시간최다강수량(mm)']
    
    result = pd.DataFrame({'평균일강수량':avg_rain, '최다일강수량':max_rain, '1시간최다강수량':hour_rain})
    return result

def year():
    result = data.copy()
    result['일시'] = result['일시'].str[:4]
    result = result.drop(result[result['일시'] == '2023'].index, axis=0)
    
    return result

def month(): 
    result = data.copy()
    result['일시'] = result['일시'].str[5:7]
    
    return result

def temp_year_info():
    df = year_info()
    data = []
    
    for i in range(df.shape[0]) :
        item = {}
        item['year'] = int(df.index[i])
        item['avg'] =  df.iloc[i, 0]
        item['max'] = df.iloc[i, 1]
        item['hour'] = df.iloc[i, 2]
        data.append(item)
        result = json.dumps(data)
        
    return result

def temp_month_info():
    df = month_info()
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