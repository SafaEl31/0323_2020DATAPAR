# 2016 US Presidential Election 



## Getting Started

The purpose of this project is to predict whether a republican  or Democrat candidate will win presidential election



## Slides presentation

https://slides.com/safaeladib/usa_presidential_election_prediction


## Dataset

This dataset is extracted from kaggle
https://www.kaggle.com/benhamner/2016-us-election

The dataset contains relevant information about the 2016 US Presidential Election, including up-to-date primary results.
The 2016 US Election dataset contains several main files and folders

Original Data Sources are:
* Primary Results from CNN
* New Hampshire County-Level Results
* County Shapefiles
* County QuickFacts



## Descriptive Analysis

An analysis to highlight the fraction votes collected by republican candidates throughout counties.


## Feature enineering

The aggregation of data conduct us to various features (55 columns). That's why, feature engineering is important in this case to detect the 15 most important feature in our Dataset. 
Since we are working with numerical input and output. The selection is performed using Pearson’s Correlation Coefficient via the f_regression() function.

## Modelling

The best model found though the hyperparameter tuning is the XGBoost Classifier. It can predict the result of presidential USA election with 87%  accuracy. 






