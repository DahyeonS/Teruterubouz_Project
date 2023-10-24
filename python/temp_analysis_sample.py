# -*- coding: utf-8 -*-
# 기온 예측 - 나이브 베이즈

# 1. 패키지 임포트
# (1) 데이터 처리
import pandas as pd
import numpy as np
# (2) 데이터 전처리
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
# (3) 데이터셋 분리
from sklearn.model_selection import train_test_split
# (4) 모델링
#from sklearn.linear_model import LogisticRegression
#from sklearn.tree import DecisionTreeClassifier
#from sklearn.ensemble import RandomForestClassifier
#from xgboost import XGBClassifier
# (5) 모델 평가
from sklearn.metrics import accuracy_score
# (6) 결과값 전송
import json

# 2. 데이터 로드
data = pd.read_csv("D:/kdigital2307/github/Teruterubouz_Project/python/기상청데이터_기온.csv").iloc[:, [2, 3, 4, 5, 7, 8]]

# 3. 데이터 전처리
# (1) 범주형 데이터 처리
label = LabelEncoder()

# (2) 데이터 정규화
scale = MinMaxScaler()

# 4. 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 5. 모델링
# (1) 나이브 베이즈
nb = GaussianNB()
nb.fit(X_tr, y_tr)
pred = nb.predict(X_val)
print("Naive Bayes -", accuracy_score(y_val, pred))

'''
# (2) 로지스틱 회귀
lr = LogisticRegression(max_iter = 300)
lr.fit(X_tr, y_tr)
pred = lr.predict(X_val)
print("Logistic Regression -", accuracy_score(y_val, pred))

# (3) 결정 트리
dt = DecisionTreeClassifier(max_depth = 7)
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)
print("Decision Tree -", accuracy_score(y_val, pred))

# (4) 랜덤 포레스트
rf = RandomForestClassifier(max_depth = 15, n_estimators = 500)
rf.fit(X_tr, y_tr)
pred = rf.predict(X_val)
print("Random Forest -", accuracy_score(y_val, pred))

# (5) XG부스트
xgb = XGBClassifier()
xgb.fit(X_tr, y_tr)
pred = xgb.predict(X_val)
print("XGBoost -", accuracy_score(y_val, pred))
'''
# 6. 최종 모델 선정 및 적용
model = GaussianNB(max_depth = 15, n_estimators = 500)
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