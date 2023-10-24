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

# 2. 결과물을 웹에 전송
app = Flask(__name__)
CORS(app)

@app.route('/')
def result():
    return 'Hello, world!'

@app.route('/seoul') # 서울
def seoul():
    return weather_info.weather('11B10101')

@app.route('/incheon') # 인천
def incheon():
    return weather_info.weather('11B20201')

@app.route('/busan') # 부산
def busan():
    return weather_info.weather('11H20201')

@app.route('/temp') # 기온 통계
def temp_info():
    return temperature.temp_info()

@app.route('/temp/rf') # 월별 기온 예측 - 랜덤포레스트
def temper_rf():
    return temp_rf.result()

@app.route('/temp/svm') # 월별 기온 예측 - 서포트 벡터머
def temper_svm():
    return temp_svm.result()

@app.route('/rain') # 월별 강수량 통계
def rain_info():
    return precipitation.rain_info()

@app.route('/rain/rf') # 월별 강수량 예측 - 랜덤포레스트
def rain_rf():
    return rain_rf.result()

@app.route('/rain/svm') # 월별 기온 예측 - 서포트 벡터머
def rain_svm():
    return rain_svm.result()

app.run(host='127.0.0.1',debug=True, port=5050)