# -*- coding: utf-8 -*-
# 기온 데이터 처리

import pandas as pd
import json

data = pd.read_csv("./기상청데이터_강수.csv").iloc[:, [2, 3, 4, 6]]
data = data.fillna(0)

def info(): 
    avg_rain = round(data.groupby(data['일시'].str[5:7]).mean()['평균일강수량(mm)'], 1)
    max_rain = round(data.groupby(data['일시'].str[5:7]).mean()['최다일강수량(mm)'], 1)
    hour_rain = round(data.groupby(data['일시'].str[5:7]).mean()['1시간최다강수량(mm)'], 1)
    
    result = pd.DataFrame({'평균일강수량':avg_rain, '최다일강수량':max_rain, '1시간최다강수량':hour_rain})
    return result

def month(): 
    result = data.copy()
    result['일시'] = result['일시'].str[5:7]
    
    return result

def rain_info():
    df = info()
    data = []
    
    for i in range(df.shape[0]) :
        item = {}
        item['month'] = int(df.index[i])
        item['avg'] =  df.iloc[i, 0]
        item['max'] = df.iloc[i, 1]
        item['hour'] = df.iloc[i, 2]
        data.append(item)
        result = json.dumps(data)
        
    return result