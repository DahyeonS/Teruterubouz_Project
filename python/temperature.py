# -*- coding: utf-8 -*-
# 기온 데이터 처리

import pandas as pd
import numpy as np

data = pd.read_csv("D:/kdigital2307/github/Teruterubouz_Project/python/기상청데이터_기온.csv").iloc[:, [2, 3, 4, 5, 7, 8]]
