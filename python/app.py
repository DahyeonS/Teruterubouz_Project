# -*- coding: utf-8 -*-
# http://127.0.0.1:5050/

# 1. 패키지 임포트
from flask import Flask
from flask_cors import CORS
import weather_info
import temperature
import temp_dt
import temp_rf

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

@app.route('/temp/year') # 연별 기온 통계
def temp_year_info():
    return temperature.temp_year_info()

@app.route('/temp/month') # 월별 기온 통계
def temp_month_info():
    return temperature.temp_month_info()

@app.route('/temp/year/dt') # 연별 기온 예측 - 의사결정나무
def temp_year_dt():
    return temp_dt.year()

@app.route('/temp/month/dt') # 월별 기온 예측 - 의사결정나무
def temp_month_dt():
    return temp_dt.month()

@app.route('/temp/year/rf') # 연별 기온 예측 - 랜덤포레스트
def temp_year_rf():
    return temp_rf.year()

@app.route('/temp/month/rf') # 월별 기온 예측 - 랜덤포레스트
def temp_month_rf():
    return temp_rf.month()

app.run(host='127.0.0.1',debug=True, port=5050)