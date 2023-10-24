# -*- coding: utf-8 -*-
# 기온 예측 - 랜덤 포레스트

# 1. 패키지 임포트
# (1) 데이터 처리
import numpy as np
import precipitation
# (2) 데이터셋 분리
from sklearn.model_selection import train_test_split
# (3) 모델링
from sklearn.svm import SVR
# (4) 모델 평가
from sklearn.metrics import mean_squared_error
# (5) 결과값 전송
import json

# 2. 데이터 로드
month = precipitation.month()

# 3. 평균일강수량 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['평균일강수량(mm)']).reshape(-1, 1)

# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
svm = SVR()
svm.fit(X_tr, y_tr)
pred = svm.predict(X_val)
print("SVM -", mean_squared_error(y_val, pred))

# (3). 모델 적용
model = SVR()
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_avg = np.round(prediction, 1)

# 4. 최다일강수량 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['최다일강수량(mm)']).reshape(-1, 1)

# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
svm.fit(X_tr, y_tr)
pred = svm.predict(X_val)
print("SVM -", mean_squared_error(y_val, pred))

# (3). 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_max = np.round(prediction, 1)

# 5. 1시간최다강수량 예측
X = np.array(month['일시']).reshape(-1, 1)
y = np.array(month['1시간최다강수량(mm)']).reshape(-1, 1)

# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
svm.fit(X_tr, y_tr)
pred = svm.predict(X_val)
print("SVM -", mean_squared_error(y_val, pred))

# (3). 모델 적용
model.fit(X, y)
month_list = [[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]]
prediction = model.predict(month_list)
month_hour = np.round(prediction, 1)

# 6. 결과 데이터 전송
def result():
    data = []
    
    for i in range(12) :
        item = {}
        item['month'] = i+1
        item['avg'] = month_avg[i]
        item['max'] = month_max[i]
        item['hour'] = month_hour[i]
        data.append(item)
    
    result = json.dumps(data)
    return result