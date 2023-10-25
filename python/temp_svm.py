# -*- coding: utf-8 -*-
# 기온 예측 - 서포트 벡터머신

# 1. 패키지 임포트
# (1) 데이터 처리
import numpy as np
import temperature
# (2) 데이터셋 분리
from sklearn.model_selection import train_test_split
# (3) 모델링
from sklearn.svm import SVR
# (4) 모델 평가
from sklearn.metrics import mean_squared_error
# (5) 결과값 전송
import json

# 2. 데이터 로드
month = temperature.month()

# 3. 평균기온 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['평균기온(℃)']).reshape(-1, 1)

# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
sv = SVR()
sv.fit(X_tr, y_tr)
pred = sv.predict(X_val)
print("SVM -", mean_squared_error(y_val, pred))

# (3). 모델 적용
model = SVR()
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_avg = np.round(prediction, 1)

# 4. 최고기온 예측
y = np.array(month['최고기온(℃)']).reshape(-1, 1)

# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
sv.fit(X_tr, y_tr)
pred = sv.predict(X_val)
print("SVM -", mean_squared_error(y_val, pred))

# (3). 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_max = np.round(prediction, 1)

# 5. 최저기온 예측
y = np.array(month['최저기온(℃)']).reshape(-1, 1)

# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
sv.fit(X_tr, y_tr)
pred = sv.predict(X_val)
print("SVM -", mean_squared_error(y_val, pred))

# (3). 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_min = np.round(prediction, 1)

# 6. 결과 데이터 전송
def result():
    data = []
    
    for i in range(12) :
        item = {}
        item['month'] = i+1
        item['avg'] = round(month_avg[i].astype('float64'), 1)
        item['max'] = round(month_max[i].astype('float64'), 1)
        item['min'] = round(month_min[i].astype('float64'), 1)
        data.append(item)
    
    result = json.dumps(data)
    return result