# -*- coding: utf-8 -*-
# 기온 데이터 처리

import pandas as pd
import numpy as np

data = pd.read_csv("D:/kdigital2307/github/Teruterubouz_Project/python/기상청데이터_기온.csv").iloc[:, [2, 3, 4, 5, 7, 8]]

def year() :
    avg_temp = data.groupby(data['일시'].str[:4]).mean()['평균기온(℃)']
    max_temp = data.groupby(data['일시'].str[:4]).mean()['평균최고기온(℃)']
    avg_temp = data.groupby(data['일시'].str[:4]).mean()['평균최저기온(℃)']
    
    result = [avg_temp, max_temp, avg_temp]
    return result

print(year())
