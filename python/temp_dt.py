# -*- coding: utf-8 -*-
# 기온 예측 - 나이브 베이즈

# 1. 패키지 임포트
# (1) 데이터 처리
import numpy as np
import temperature
# (2) 데이터셋 분리
from sklearn.model_selection import train_test_split
# (3) 모델링
from sklearn.tree import DecisionTreeRegressor
# (4) 결과값 전송
import json

# 2. 데이터 로드
year = temperature.year()
month = temperature.month()

# 3. 연간 데이터 분석
# (1). 평균기온 예측
X = np.array([year['일시']]).reshape(-1, 1)
y = np.array(year['평균기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
dt = DecisionTreeRegressor()
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)

# 모델 적용
model = DecisionTreeRegressor()
model.fit(X, y)
prediction = model.predict([['2024']])
year_avg = round(prediction[0], 1)

# (2). 최고기온 예측
X = np.array(year['일시']).reshape(-1, 1)
y = np.array(year['최고기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)

# 모델 적용
model.fit(X, y)
prediction = model.predict([['2024']])
year_max = round(prediction[0], 1)

# (3). 최저기온 예측
X = np.array(year['일시']).reshape(-1, 1)
y = np.array(year['최저기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)

# 모델 적용
model.fit(X, y)
prediction = model.predict([['2024']])
year_min = round(prediction[0], 1)

# 4. 월간 데이터 분석
# (1). 평균기온 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['평균기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)

# 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_avg = np.round(prediction, 1)

# (2). 최고기온 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['최고기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)

# 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_max = np.round(prediction, 1)

# (3). 최저기온 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['최저기온(℃)']).reshape(-1, 1)

# 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 모델링
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)

# 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_min = np.round(prediction, 1)

# 5. 결과 데이터 전송
def year():
    data = []
    
    item = {}
    item['year'] = 2024
    item['avg'] = year_avg
    item['max'] = year_max
    item['min'] = year_min
    data.append(item)
    
    result = json.dumps(data)
    return result

def month():
    data = []
    
    for i in range(12) :
        item = {}
        item['month'] = i+1
        item['avg'] = month_avg[i]
        item['max'] = month_max[i]
        item['min'] = month_min[i]
        data.append(item)
    
    result = json.dumps(data)
    return result