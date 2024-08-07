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

@app.route('/seoul') # 서울
def seoul():
    return weather_info.weather('11B10101')

@app.route('/incheon') # 인천
def incheon():
    return weather_info.weather('11B20201')

@app.route('/busan') # 부산
def busan():
    return weather_info.weather('11H20201')

@app.route('/daejeon') # 대전
def daejeon():
    return weather_info.weather('11C20401')

@app.route('/daegu') # 대구
def daegu():
    return weather_info.weather('11H10701')

@app.route('/ulsan') # 울산
def ulsan():
    return weather_info.weather('11H20101')

@app.route('/sejong') # 세종
def sejong():
    return weather_info.weather('11C20404')

@app.route('/gwangju') # 광주
def gwangju():
    return weather_info.weather('11B20702')

@app.route('/jeju') # 제주
def jeju():
    return weather_info.weather('11G00201')

@app.route('/chuncheon') # 춘천
def chuncheon():
    return weather_info.weather('11D10301')

@app.route('/gangneung') # 강릉
def gangneung():
    return weather_info.weather('11D20501')

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

if __name__ == "__main__":
    app.run(host='127.0.0.1',debug=True, port=5050)