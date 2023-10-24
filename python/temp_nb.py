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
from sklearn.naive_bayes import GaussianNB
# (5) 모델 평가
from sklearn.metrics import accuracy_score
# (6) 결과값 전송
import json

# 2. 데이터 로드
year = temperature.year()
month = temperature.month()

# 3. 연간 데이터 분석



# (1). 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# (2). 모델링
nb = GaussianNB()
nb.fit(X_tr, y_tr)
pred = nb.predict(X_val)
print("Naive Bayes -", accuracy_score(y_val, pred))

# (3). 모델 적용
model = GaussianNB()
model.fit(X, y)
prediction = model.predict(x_test)

def result():
    data = []
    for i in range(len(x_test_id)) :
        item = {}
        item["id"] =  str(x_test_id.iloc[i])
        item["smoke"] = str(prediction[i])
        data.append(item)
    result = json.dumps(data)
    return result