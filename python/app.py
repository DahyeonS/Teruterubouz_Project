# -*- coding: utf-8 -*-
# http://127.0.0.1:5050/

# 1. 패키지 임포트
import pandas as pd
import numpy as np
import json
from flask import Flask
from flask_cors import CORS
import weather_info
'''
# 2. 결과물을 JSON으로 변환
# (1) 분석 데이터 결과
data = []
for i in range(len(x_test_id)) :
    item = {}
    item["id"] =  str(x_test_id.iloc[i])
    item["smoke"] = str(prediction[i])
    data.append(item)
'''
# (2) 날씨 데이터 조회
def weather(reg):
    df = weather_info.weather(reg)
    data = []
    for i in range(df.shape[0]) :
        item = {}
        item["date"] =  str(df.iloc[i, 2])
        item["prob"] = str(df.iloc[i, -3])
        item["sky"] = str(df.iloc[i, -2])
        item["rain"] = str(df.iloc[i, -1])
        data.append(item)
        result = json.dumps(data)
    return result

# 3. 변환된 결과물을 웹에 전송
app = Flask(__name__)
CORS(app)

@app.route('/')
def result():
    return "Hello, world!"
'''
@app.route('/data')
def result():
    result = json.dumps(data)
    return result
'''
@app.route('/seoul') # 서울
def seoul():
    return weather('11B10101')

@app.route('/incheon') # 인천
def incheon():
    return weather('11B20201')

@app.route('/busan') # 부산
def busan():
    return weather('11H20201')

app.run(host='127.0.0.1',debug=True, port=5050)