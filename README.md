# Analysis of King County Housing Data and Data Warehousing Principles

#### (PART I)

## 📚 Introduction

A comprehensive analysis was conducted on housing data from King County, Washington, alongside an evaluation of data warehousing concepts. The dataset, obtained from Kaggle, contains house sales data from May 2014 to May 2015, consisting of 21 attributes related to various property characteristics. 

To facilitate effective analysis, the dataset was reduced to 3250 observations using RStudio, while maintaining all original attributes. Additionally, 2% of the data was intentionally modified to include missing values for the purpose of demonstrating data handling techniques. 

The study further explores data warehousing principles through a case study on Landbay, a UK-based mortgage lending platform, assessing its data pipeline based on scalability, data integration, governance, flexibility, and cost efficiency.

## 🗒️ Main Areas of Discussion

### 1.0 Metadata of the Dataset

#### 📌 Dataset Overview

    ▪️ The dataset is named “HOUSE” and is located within the “WORK” library in SAS Studio.
    
    ▪️ It contains 3250 observations (rows) and 21 attributes (columns), representing house sales data from King County, Washington, from May 2014 to May 2015.
    
#### 📌 Attributes

    ▪️ The dataset includes the following 21 attributes: id, date, price, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view, condition, grade, sqft_above, sqft_basement, yr_built, yr_renovated, zipcode, lat, long, sqft_living15, and sqft_lot15.
    
#### 📌 Data Types

    ▪️ The majority of the attributes are numericThe majority of the attributes are numeric. 

#### 📌 Data Type Issues

    ▪️ id is stored as a numeric variable, representing a unique identifier for each property. However, as it holds no mathematical significance, it will not be analyzed statistically.

    ▪️ zipcode is stored as a numeric variable but represents geographic regions, so it should be converted to a character type, as it does not possess mathematical relevance.

    ▪️ The date attribute, representing the date the house was sold, is currently in character type but ideally should be stored as a date variable for accurate time-based analysis.
    
    ▪️ The yr_renovated attribute contains year values but includes '0' for properties that were not renovated, which will need adjustment to properly reflect non-renovation year.

---

### 2.0 Initial Data Exploration

#### 📌 Summarizing Properties

    ▪️ Key summarizing properties, including mean, variance, standard deviation, distribution, median, and percentiles, were calculated for the following attributes: price, bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view, condition, grade, lat, long, yr_built, yr_renovated, sqft_above, sqft_basement, sqft_living15, and sqft_lot15.

#### 📌 Missing Values

    ▪️ Missing values were present in these 16 attributes: price, bedrooms, sqft_living, sqft_lot, grade, condition, view, floors, waterfront, sqft_above, sqft_basement, yr_built, lat, long, sqft_living15, and sqft_lot15. 

#### 📌 Outlier Detection and Analysis

    ▪️ Method Used for Outlier Detection: Outliers were identified using boxplots and kurtosis values. 
    
    ▪️ Legitimate Outliers: Outliers were detected in price, bedrooms, sqft_living, grade, condition, view, sqft_above, sqft_basement, long, sqft_living15, and sqft_lot. These are considered genuine as they reflect real-world variations like high prices and large living areas, so they will not be removed.

    ▪️ Erroneous outliers: Observation 9 in the sqft_lot attribute recorded a 533,610 square foot lot but had only one bedroom, one bathroom, and a small 800 square foot living area, far below the average for neighboring properties. Due to this inconsistency, it is considered illogical and will be removed.

#### 📌 Inconsistencies Identified

    ▪️ The bedrooms attribute included two entries with zero bedrooms, which were flagged for removal due to their implausibility.
    

    


