# 개요
**데이터 분석 결과물, 실시간 예보 데이터를 스프링으로 호출하기 위한 파이썬 파일들을 모아놓은 곳입니다.**

*CSV 출처 https://data.kma.go.kr/climate/RankState/selectRankStatisticsDivisionList.do?pgmNo=179*

## *app.py*
**결과 값을 전송합니다.**

## *weather_info.py*
**실시간 예보를 전송받아 처리합니다.**

*출처 https://apihub.kma.go.kr/*

## *temperature.py*
**기온 데이터를 처리하는 곳입니다.**

### *temp_rf.py*
**랜덤 포레스트를 이용하여 월별 기온을 예측합니다.**

### *temp_svm.py*
**서포트 벡터머신을 이용하여 월별 기온을 예측합니다.**

## *precipitation.py*
**강수량 데이터를 처리하는 곳입니다.**

### *rain_rf.py*
**랜덤 포레스트를 이용하여 월별 강수량을 예측합니다.**

### *rain_svm.py*
**서포트 벡터머신을 이용하여 월별 강수량을 예측합니다.**
