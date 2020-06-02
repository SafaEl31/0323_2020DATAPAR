# Air pollution Analysis



## Getting Started

The purpose of this study is to review the current situation of air pollution. 
This phenomena refers to the release of pollutants into the air that are detrimental to human health and the planet as a whole.
It also contributes to the depletion of the ozone layer, which protects the Earth from the sun's UV rays. 

This analysis aims to describe the level of threat that the humanity is facing, locate the most harmfull area in the world.


## Slides presentation

https://slides.com/safaeladib/air_pollution_analysis


## Dataset

This dataset is based BigQuery Dataset from Kaggle. It contains real-time air quality data from around the world. The data includes air quality measurements from 7587 locations in 98 countries. It is Updated weekly


## Descriptive Analysis

Air pollution is due to the presence of some pollutants, here is a quick definition of the main pollutants that are present in our database:

* Sulphur dioxide ( SO2 ) : Gas mainly emitted during the combustion of fossil fuels such as crude oil and coal.
* Carbon monoxide ( CO ) : Gas emitted during incomplete combustion of fuels example : A car engine running in a closed room.
* Nitrogen dioxide ( NO2 ) : These contaminants are emitted by traffic, combustion installations and the industries.
* Ozone ( O3 ) : Ozone is created through the influence of ultra violet sunlight (UV) on pollutants in the outside air.
* Particulate Matter ( PM ) : Particulate matter is the sum of all solid and liquid particles suspended in air. This complex mixture includes both organic and inorganic particles, such as dust, pollen, soot, smoke, and liquid droplets. These particles vary greatly in size, composition, and origin.

In this section, data visualization lead us to determine the most polluated countries in the world; such as India, Poland and china.


## Clustering

To manipulate data and explore some hidden information, clustering is the ideal process. Elbow method used to find the best number of clusters gives us 5 clusters.

Applying clusters to the dataset allow us to have 2 main set of clusters.
* Set1: DATA ghatered during 2020 in cluster 1: All those data are related to the same city Delhi in 2020 and all kind of pollutant is recorded averaged over 1/4 hour.
* Set2: DATA ghatered during 2020 in cluster 2: All those data are related to the same country austria and averaged over an hour in 2020.





