# Bank marketing



## Getting Started

This is a classification project to predict if the client will subscribe a term deposit. A Term deposit is a deposit that a bank or a financial institution offers with a fixed rate (often better than just opening deposit account) in which your money will be returned back at 
a specific maturity time. 


## Slides presentation

https://slides.com/safaeladib/bank_marketing


## Dataset

This dataset is based on “Bank Marketing” UCI dataset
https://archive.ics.uci.edu/ml/datasets/Bank+Marketing


## Descriptive Analysis

 In order to determine the main factors that impact the target, this project contains a descriptive analysis. It highlights the characteristic of a typical customer of the deposit term service. 

## Predictive models

This section comparaison, between several models appliyed on our dataset, in order to predict precisely as much as we can, if the customer will subscribe in a term deposit. 

### Models:

* KNeighborsClassifier
* XGBClassifier 
* NuSVC
* DecisionTreeClassifier
* RandomForestClassifier

### Model selection

 To evaluate the efficiency of the cassifiers, the Roc curve analysis is the best way to do so. 
 The XGBOOST CLASSIFIER represents good model to predict the classification of our target with accuracy of 90%.



