# Analysis of King County Housing Data and Data Warehousing Principles

#### (PART I)

## 📚 Introduction

A comprehensive analysis was conducted on housing data from King County, Washington, alongside an evaluation of data warehousing concepts. The dataset, obtained from Kaggle, contains house sales data from May 2014 to May 2015, consisting of 21 attributes related to various property characteristics. 

To facilitate effective analysis, the dataset was reduced to 3250 observations using RStudio, while maintaining all original attributes. Additionally, 2% of the data was intentionally modified to include missing values for the purpose of demonstrating data handling techniques. 

The study further explores data warehousing principles through a case study on Landbay, a UK-based mortgage lending platform, assessing its data pipeline based on scalability, data integration, governance, flexibility, and cost efficiency.

## 🗒️ Main Areas of Discussion

### 1.0 Metadata of the Dataset

#### 📌 1.1 Dataset Overview

    ▪️ The dataset is named “HOUSE” and is located within the “WORK” library in SAS Studio.
    
    ▪️ It contains 3250 observations (rows) and 21 attributes (columns), representing house sales data from King County, Washington, from May 2014 to May 2015.
    
#### 📌 1.2 Attributes

    ▪️ The dataset includes the following 21 attributes: "id", "date", "price", "bedrooms", "bathrooms", "sqft_living", "sqft_lot", "floors", "waterfront", "view", "condition", "grade", "sqft_above", "sqft_basement", "yr_built", "yr_renovated", "zipcode", "lat", "long", "sqft_living15", and "sqft_lot15".
    
#### 📌 1.3 Data Types

![Screenshot 2024-10-25 183705](https://github.com/user-attachments/assets/809c1d6c-c032-4d0a-ac5a-d5ad8a8bf9e0)

    ▪️ The majority of the attributes are numeric. 

#### 📌 1.4 Data Type Issues

    ▪️ "id" is stored as a numeric variable, representing a unique identifier for each property. However, as it holds no mathematical significance, it will not be analyzed statistically.

    ▪️ "zipcode" is stored as a numeric variable but represents geographic regions, so it should be converted to a character type, as it does not possess mathematical relevance.

    ▪️ The "date" attribute, representing the date the house was sold, is currently in character type but ideally should be stored as a date variable for accurate time-based analysis.
    
    ▪️ The "yr_renovated" attribute contains year values but includes '0' for properties that were not renovated, which will need adjustment to properly reflect non-renovation year.

---

### 2.0 Initial Data Exploration

#### 📌 2.1 Summarizing Properties

    ▪️ Key summarizing properties, including mean, variance, standard deviation, distribution, median, and percentiles, were calculated for the following attributes: "price", "bedrooms", "bathrooms", "sqft_living", "sqft_lot", "floors", "waterfront", "view", "condition", "grade", "lat", "long", "yr_built", "yr_renovated", "sqft_above", "sqft_basement", "sqft_living15", and "sqft_lot15".

#### 📌 2.2 Missing Values

    ▪️ Missing values were present in these 16 attributes: "price", "bedrooms", "sqft_living", "sqft_lot", "grade', "condition", "view", "floors", "waterfront", "sqft_above", "sqft_basement", "yr_built", "lat", "long", "sqft_living15", and "sqft_lot15". 

#### 📌 2.3 Outlier Detection and Analysis

    ▪️ Method Used for Outlier Detection: Outliers were identified using boxplots and kurtosis values. 
    
    ▪️ Legitimate Outliers: Outliers were detected in "price", "bedrooms", "sqft_living", "grade", "condition", "view", "sqft_above", "sqft_basement", "long", "sqft_living15", and "sqft_lot". These are considered genuine as they reflect real-world variations like high prices and large living areas, so they will not be removed.

    ▪️ Erroneous outlier: Observation 9 in the "sqft_lot" attribute recorded a 533,610 square foot lot but had only one bedroom, one bathroom, and a small 800 square foot living area, far below the average for neighboring properties. Due to this inconsistency, it is considered illogical and will be removed.

#### 📌 2.4 Inconsistencies Identified

    ▪️ The "bedrooms" attribute included two entries with zero bedrooms, which were flagged for removal due to their implausibility.

##### ⚠️ Note: All missing values, outliers, inconsistencies, and incorrect data types identified will be addressed in [Part II](https://github.com/Weetynn/housingdata-dm-ii.git). 

---

### 3.0 Data Warehouse Concepts

#### 📌 3.1 Data Warehouse Evaluation Criteria

    ▪️ Scalability and Performance: The warehouse should scale vertically or horizontally to manage increasing data volumes without impacting performance.
    
    ▪️ Data Integration: Supports structured and semi-structured data from various sources through ETL (Extract, Transform, Load) or ELT (Extract, Load, Transform) pipelines.

    ▪️ Data Governance: Ensures data accuracy, security, and compliance with regulations like GDPR and CCPA, implementing access controls and audit trails.

    ▪️ Flexibility and Adaptability: Supports traditional business intelligence, machine learning, and real-time data processing, adapting to new tools and changing business needs.

    ▪️ Cost Efficiency: Considers total cost, including setup, maintenance, and scalability, with cloud-based solutions offering flexible pay-as-you-go models.

---

### 4.0 Case Study on Landbay

🏢 Company Background

Landbay, a UK-based mortgage lending platform, connects institutional investors with property loans. As the business grew, it needed a scalable data infrastructure to handle increasing data volumes and provide real-time insights. 

The platform transitioned from a manual pipeline to a more advanced, automated solution, which will be evaluated based on the abovementioned criteria:

#### 📌 4.1 Initial Data Pipeline

![Diagram-1-architecture-landbay](https://github.com/user-attachments/assets/2001d143-f910-4fc7-80ae-92f5d8d32bcf)

    ▪️ Landbay's original pipeline relied on manual ETL processes, which lacked scalability and automation. This led to slower data processing and limited the company's ability to manage larger data volumes as the business expanded.

#### 📌 4.2 Latest Data Pipeline

![Landbay-Architecture-2](https://github.com/user-attachments/assets/2e20a93a-9b32-4aee-bf03-0ab6ed356a99)

    ▪️ The current pipeline leverages Amazon Redshift with an ELT model, enabling real-time data processing and faster decision-making. It uses AWS Glue and Spectrum for automated data transformation, improving both performance and scalability while reducing costs.

#### 📌 4.3 Evaluation Based on the Five Criteria
    
    ▪️ Scalability and Performance: The switch to Amazon Redshift significantly improved scalability, allowing Landbay to efficiently handle large and growing datasets without compromising performance.

    ▪️ Data Integration: The use of ELT processes and AWS Glue enables seamless integration of structured and semi-structured data, streamlining data from multiple sources for efficient analysis.

    ▪️ Data Governance: Landbay’s new pipeline ensures data security and compliance with regulatory requirements such as GDPR, using access controls and audit trails to maintain data governance standards.
    
    ▪️ Flexibility and Adaptability: The latest pipeline supports traditional analytics and more advanced tools like machine learning, adapting to Landbay’s evolving business needs and enabling real-time insights for investors.
    
    ▪️ Cost Efficiency: By transitioning to cloud-based Amazon Redshift, Landbay achieved cost savings with flexible pricing models, paying only for the resources used while benefiting from reduced infrastructure costs.

#### 📌 4.4 Benefits
    
    ▪️ The improved pipeline allows Landbay to manage increasing data volumes, maintain data governance standards, and provide real-time insights to institutional investors. These enhancements have optimized operational efficiency and portfolio management, especially during the COVID-19 pandemic.

   




