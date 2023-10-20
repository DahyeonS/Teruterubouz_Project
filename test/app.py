#@title 성인 건강검진 데이터

import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split
#from sklearn.naive_bayes import GaussianNB
#from sklearn.linear_model import LogisticRegression
#from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
#from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score
import json

#데이터 로드
x_train = pd.read_csv("https://raw.githubusercontent.com/Datamanim/datarepo/main/smoke/x_train.csv")
y_train = pd.read_csv("https://raw.githubusercontent.com/Datamanim/datarepo/main/smoke/y_train.csv")
x_test= pd.read_csv("https://raw.githubusercontent.com/Datamanim/datarepo/main/smoke/x_test.csv")

X = x_train.drop("ID", axis = 1)
y = y_train.drop("ID", axis = 1)
x_test_id = x_test.pop("ID")

label = LabelEncoder()
X["성별코드"] = label.fit_transform(X["성별코드"])
X["구강검진수검여부"] = label.fit_transform(X["구강검진수검여부"])
X["치석"] = label.fit_transform(X["치석"])
x_test["성별코드"] = label.fit_transform(x_test["성별코드"])
x_test["구강검진수검여부"] = label.fit_transform(x_test["구강검진수검여부"])
x_test["치석"] = label.fit_transform(x_test["치석"])

scale = MinMaxScaler()
target = ["체중(5Kg단위)", "수축기혈압", "이완기혈압", "식전혈당(공복혈당)", "총콜레스테롤", "트리글리세라이드", "HDL콜레스테롤", "LDL콜레스테롤", "(혈청지오티)AST"]
X[target] = scale.fit_transform(X[target])

X_tr, X_val, y_tr, y_val = train_test_split(X, y, test_size = 0.25, random_state = 123)
'''
nb = GaussianNB()
nb.fit(X_tr, y_tr)
pred = nb.predict(X_val)
print("Naive Bayes -", accuracy_score(y_val, pred))

lr = LogisticRegression(max_iter = 300)
lr.fit(X_tr, y_tr)
pred = lr.predict(X_val)
print("Logistic Regression -", accuracy_score(y_val, pred))

dt = DecisionTreeClassifier(max_depth = 7)
dt.fit(X_tr, y_tr)
pred = dt.predict(X_val)
print("Decision Tree -", accuracy_score(y_val, pred))

rf = RandomForestClassifier(max_depth = 15, n_estimators = 500)
rf.fit(X_tr, y_tr)
pred = rf.predict(X_val)
print("Random Forest -", accuracy_score(y_val, pred))

xgb = XGBClassifier()
xgb.fit(X_tr, y_tr)
pred = xgb.predict(X_val)
print("XGBoost -", accuracy_score(y_val, pred))
'''
model = RandomForestClassifier(max_depth = 15, n_estimators = 500)
model.fit(X, y)
prediction = model.predict(x_test)

data = []
for i in range(len(x_test_id)) :
    item = {}
    item["id"] =  str(x_test_id.iloc[i])
    item["smoke"] = str(prediction[i])
    data.append(item)
   
from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/data')
def result():
    result = json.dumps(data)
    return result

app.run(host='127.0.0.1',debug=True, port=5050)