# Data Preprocess

import numpy as np      #mathametical
import matplotlib.pyplot as plt
import pandas as pd    #import datasets

#dataset
dataset = pd.read_csv('C:\Users\Gaurav Mittal\Desktop\ML\Regresion\Salary_Data.csv')
X= dataset.iloc[:, :-1].values
Y= dataset.iloc[:, 1].values

#Splitting data into test and training data
from sklearn.cross_validation import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size =1/3, random_state=0)

#Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test) """

#Fitting data
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, Y_train)

#Predicting
Y_pred = regressor.predict(X_test)

#Visualising Data
plt.scatter(X_train, Y_train, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salary vs Experience(Test_Set)')
plt.xlabel('Experience')
plt.ylabel('Salary')


