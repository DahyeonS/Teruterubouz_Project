# -*- coding: utf-8 -*-
# http://127.0.0.1:5050/

# 1. 패키지 임포트
from flask import Flask
from flask_cors import CORS

import weather_info
import temperature
import temp_rf
import temp_svm
import precipitation
import rain_rf
import rain_svm

# 2. 결과물을 웹에 전송
app = Flask(__name__)
CORS(app)

@app.route('/')
def result():
    return 'Hello, world!'

@app.route('/weather') # 실시간 예보
def weather():
    return weather_info.result()

@app.route('/temp') # 월별 기온 통계
def temp_info():
    return temperature.temp_info()

@app.route('/temp/rf') # 월별 기온 예측 - 랜덤포레스트
def temper_rf():
    return temp_rf.result()

@app.route('/temp/svm') # 월별 기온 예측 - 서포트 벡터머신
def temper_svm():
    return temp_svm.result()

@app.route('/rain') # 월별 강수량 통계
def pre_info():
    return precipitation.rain_info()

@app.route('/rain/rf') # 월별 강수량 예측 - 랜덤포레스트
def pre_rf():
    return rain_rf.result()

@app.route('/rain/svm') # 월별 강수량 예측 - 서포트 벡터머신
def pre_svm():
    return rain_svm.result()

app.run(host='127.0.0.1',debug=True, port=5050)