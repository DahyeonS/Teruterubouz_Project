# -*- coding: utf-8 -*-
# 기온 예측 - 나이브 베이즈

# 1. 패키지 임포트
# (1) 데이터 처리
import pandas as pd
import numpy as np
import temperature
# (2) 데이터 전처리
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
# (3) 데이터셋 분리
from sklearn.model_selection import train_test_split
# (4) 모델링
from sklearn.linear_model import LinearRegression
# (5) 모델 평가
from sklearn.metrics import mean_squared_error
# (6) 결과값 전송
import json

# 2. 데이터 로드
year = temperature.year()
month = temperature.month()

# 3. 연간 데이터 분석
# (1). 평균기온 예측
X = np.array(year['일시']).reshape(-1, 1)
y = np.array(year['평균기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
lr = LinearRegression()
lr.fit(X_tr, y_tr)
pred = lr.predict(X_val)
print("Linear Regression -", mean_squared_error(y_val, pred))

# 모델 적용
model = LinearRegression()
model.fit(X, y)
prediction = model.predict([['2024']])
year_avg = round(prediction[0][0], 1)

# (2). 최고기온 예측
X = np.array(year['일시']).reshape(-1, 1)
y = np.array(year['최고기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
lr = LinearRegression()
lr.fit(X_tr, y_tr)
pred = lr.predict(X_val)
print("Linear Regression -", mean_squared_error(y_val, pred))

# 모델 적용
model = LinearRegression()
model.fit(X, y)
prediction = model.predict([['2024']])
year_max = round(prediction[0][0], 1)

# (3). 최저기온 예측
X = np.array(year['일시']).reshape(-1, 1)
y = np.array(year['최저기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
lr = LinearRegression()
lr.fit(X_tr, y_tr)
pred = lr.predict(X_val)
print("Linear Regression -", mean_squared_error(y_val, pred))

# 모델 적용
model = LinearRegression()
model.fit(X, y)
prediction = model.predict([['2024']])
year_min = round(prediction[0][0], 1)

# 3. 월간 데이터 분석
# (1). 평균기온 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['평균기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
lr = LinearRegression()
lr.fit(X_tr, y_tr)
pred = lr.predict(X_val)
print("Linear Regression -", mean_squared_error(y_val, pred))

# 모델 적용
model = LinearRegression()
model.fit(X, y)
month = [['01']]
prediction = model.predict()
year_avg = round(prediction[0][0], 1)

def year():
    data = []
    item = {}
    
    item["year"] =  '2024'
    item["avg"] = year_avg
    item["max"] = year_max
    item["min"] = year_min
    data.append(item)
    
    result = json.dumps(data)
    return result