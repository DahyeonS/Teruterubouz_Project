# -*- coding: utf-8 -*-
# 기온 데이터 처리

import pandas as pd

data = pd.read_csv("D:/kdigital2307/github/Teruterubouz_Project/python/기상청데이터_기온.csv").iloc[:, [2, 3, 4, 5, 7, 8]]

def year():
    avg_temp = round(data.groupby(data['일시'].str[:4]).mean()['평균기온(℃)'], 1)[:-1]
    max_temp = data.groupby(data['일시'].str[:4]).max()['평균최고기온(℃)'][:-1]
    min_temp = data.groupby(data['일시'].str[:4]).min()['평균최저기온(℃)'][:-1]
    
    result = pd.DataFrame({'평균기온':avg_temp, '평균최고기온':max_temp, '평균최저기온':min_temp})
    return result

def month(): 
    avg_temp = round(data.groupby(data['일시'].str[5:7]).mean()['평균기온(℃)'], 1)
    max_temp = data.groupby(data['일시'].str[5:7]).max()['평균최고기온(℃)']
    min_temp = data.groupby(data['일시'].str[5:7]).min()['평균최저기온(℃)']
    
    result = pd.DataFrame({'평균기온':avg_temp, '평균최고기온':max_temp, '평균최저기온':min_temp})
    return result