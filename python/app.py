# -*- coding: utf-8 -*-
# http://127.0.0.1:5050/

# <데이터 분석>
# 1. 패키지 임포트
# (1) 데이터 처리
import pandas as pd
import numpy as np
'''
# (2) 데이터 전처리
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
# (3) 데이터셋 분리
from sklearn.model_selection import train_test_split
# (4) 모델링
from sklearn.naive_bayes import GaussianNB
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from xgboost import XGBClassifier
# (5) 모델 평가
from sklearn.metrics import accuracy_score
'''

'''
# 2. 데이터 로드
x_train = pd.read_csv("")
y_train = pd.read_csv("")
x_test= pd.read_csv("")

X = x_train.drop("ID", axis = 1)
y = y_train.drop("ID", axis = 1)
x_test_id = x_test.pop("ID")

# 3. 데이터 전처리
# (1) 범주형 데이터 처리
label = LabelEncoder()
X["성별코드"] = label.fit_transform(X["성별코드"])
X["구강검진수검여부"] = label.fit_transform(X["구강검진수검여부"])
X["치석"] = label.fit_transform(X["치석"])
x_test["성별코드"] = label.fit_transform(x_test["성별코드"])
x_test["구강검진수검여부"] = label.fit_transform(x_test["구강검진수검여부"])
x_test["치석"] = label.fit_transform(x_test["치석"])

# (2) 데이터 정규화
scale = MinMaxScaler()
target = ["체중(5Kg단위)", "수축기혈압", "이완기혈압", "식전혈당(공복혈당)", "총콜레스테롤", "트리글리세라이드", "HDL콜레스테롤", "LDL콜레스테롤", "(혈청지오티)AST"]
X[target] = scale.fit_transform(X[target])

# 4. 데이터셋 분리
X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)

# 5. 모델링
# (1) 나이브 베이즈
nb = GaussianNB()
nb.fit(X_tr, y_tr)
pred = nb.predict(X_val)
print("Naive Bayes -", accuracy_score(y_val, pred))

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

# 6. 최종 모델 선정 및 적용
model = RandomForestClassifier(max_depth = 15, n_estimators = 500)
model.fit(X, y)
prediction = model.predict(x_test)

'''
# <웹 전송>
# (1) 패키지 임포트
import json
from flask import Flask
from flask_cors import CORS
import weather_info
'''
# (2) 결과물을 JSON으로 변환
data = []
for i in range(len(x_test_id)) :
    item = {}
    item["id"] =  str(x_test_id.iloc[i])
    item["smoke"] = str(prediction[i])
    data.append(item)
'''
# (3) 변환된 결과물을 웹에 전송
app = Flask(__name__)
CORS(app)

@app.route('/')
def result():
    return "Hello, world!"
'''
@app.route('/data')
def result():
    result = json.dumps(data)
    return result
'''
@app.route('/seoul')
def result():
    item = weather_info.weather('11B10101')
    data = []
    
    result = json.dumps(data)
    return result

app.run(host='127.0.0.1',debug=True, port=5050)
