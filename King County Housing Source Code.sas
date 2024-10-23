/* Program: Data Management */
/* Author: Abigail Wee Tynn */
/* Date: 25th September 2023 */

*Print dataset;
proc print data = m_data.house;
run;

*Make a copy of the dataset;
data house;
	set m_data.house;
run;

*Printing the Metadata;
proc contents data = house;
run;

*Using PROC UNIVARIATE on all variables;
proc univariate plot data = house;
run;

/* price VARIABLE */
*Compute quartiles for the 'price' variable;
PROC UNIVARIATE DATA=house;
    VAR price;
    OUTPUT OUT=OutliersPrice (RENAME=(price=OriginalPrice))
    Q1=Q1_price Q3=Q3_price;
RUN;

*Detect and store outliers for 'price' in the OutliersListPrice dataset;
DATA OutliersListPrice (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersPrice;

    IQR = Q3_price - Q1_price;
    LowerBound = Q1_price - 1.5 * IQR;
    UpperBound = Q3_price + 1.5 * IQR;

    /* Check if the price value is an outlier */
    IF price < LowerBound OR price > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = price;
        OUTPUT;
    END;

    DROP IQR LowerBound UpperBound Q1_price Q3_price;
RUN;

*Print detected outliers;
PROC PRINT DATA=OutliersListPrice;
RUN;

*Visualize 'price' distribution with a boxplot;
PROC SGPLOT DATA=house;
    VBOX price;
RUN;






/* bedrooms VARIABLE */
/* Compute quartiles for the 'bathrooms' variable */
PROC UNIVARIATE DATA=house;
    VAR bedrooms;
    OUTPUT OUT=OutliersBedrooms (RENAME=(bedrooms=OriginalBedrooms))
    Q1=Q1_bedrooms Q3=Q3_bedrooms;
RUN;

/* Detect and store outliers for 'bathrooms' in a new dataset */
DATA OutliersListBedrooms (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersBedrooms;
    IQR = Q3_bedrooms - Q1_bedrooms;
    LowerBound = Q1_bedrooms - 1.5 * IQR;
    UpperBound = Q3_bedrooms + 1.5 * IQR;
    IF bedrooms < LowerBound OR bedrooms > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = bedrooms;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_bedrooms Q3_bedrooms;
RUN;

/* Print detected outliers */
PROC PRINT DATA=OutliersListBedrooms;
RUN;

/* Visualize 'bedrooms' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX bedrooms;
RUN;

/* Create a new dataset with the filtered observations */
data filtered_bedrooms;
    set house;
    if bedrooms in (6, 7, 8);
run;

/* Print the filtered observations */
proc print data=filtered_bedrooms; 
run;


/* sqft_living VARIABLE */
* Compute quartiles for the 'sqft_living' variable;
PROC UNIVARIATE DATA=house;
    VAR sqft_living;
    OUTPUT OUT=OutliersSqftLiving (RENAME=(sqft_living=OriginalSqftLiving))
    Q1=Q1_sqft_living Q3=Q3_sqft_living;
RUN;

* Detect and store outliers for 'sqft_living' in a new dataset;
DATA OutliersListSqftLiving (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersSqftLiving;
    IQR = Q3_sqft_living - Q1_sqft_living;
    LowerBound = Q1_sqft_living - 1.5 * IQR;
    UpperBound = Q3_sqft_living + 1.5 * IQR;
    IF sqft_living < LowerBound OR sqft_living > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = sqft_living;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_sqft_living Q3_sqft_living;
RUN;

* Print detected outliers for 'sqft_living';
PROC PRINT DATA=OutliersListSqftLiving;
RUN;

* Visualize 'sqft_living' distribution with a boxplot;
PROC SGPLOT DATA=house;
    VBOX sqft_living;
RUN;

/* Create a new dataset with the filtered observations */
data filtered_living;
    set house;
    if sqft_living in (5480, 8010, 5780, 5120, 5770, 7390, 5320, 5640, 5220, 5050, 
                       6810, 5830, 6550, 5960, 7000, 6050, 7220, 5080, 5270, 6880, 
                       5400, 5280, 5360, 7080, 5040, 5450, 5180, 5330, 5350, 5440, 
                       6050, 5540, 7440);
run;

/* Print the filtered observations */
proc print data=filtered_living; 
run;


/* sqft_lot VARIABLE */
/* Compute quartiles for the 'sqft_lot' variable */
PROC UNIVARIATE DATA=house;
    VAR sqft_lot;
    OUTPUT OUT=OutliersSqftLot (RENAME=(sqft_lot=OriginalSqftLot))
    Q1=Q1_sqft_lot Q3=Q3_sqft_lot;
RUN;

/* Detect and store outliers for 'sqft_lot' in a new dataset */
DATA OutliersListSqftLot (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersSqftLot;
    IQR = Q3_sqft_lot - Q1_sqft_lot;
    LowerBound = Q1_sqft_lot - 1.5 * IQR;
    UpperBound = Q3_sqft_lot + 1.5 * IQR;
    IF sqft_lot < LowerBound OR sqft_lot > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = sqft_lot;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_sqft_lot Q3_sqft_lot;
RUN;

/* Print detected outliers for 'sqft_lot' */
PROC PRINT DATA=OutliersListSqftLot;
RUN;

/* Visualize 'sqft_lot' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX sqft_lot;
RUN;


/* grade VARIABLE */
/* Compute quartiles for the 'grade' variable */
PROC UNIVARIATE DATA=house;
    VAR grade;
    OUTPUT OUT=OutliersGrade (RENAME=(grade=OriginalGrade))
    Q1=Q1_grade Q3=Q3_grade;
RUN;

/* Detect and store outliers for 'grade' in a new dataset */
DATA OutliersListGrade (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersGrade;
    IQR = Q3_grade - Q1_grade;
    LowerBound = Q1_grade - 1.5 * IQR;
    UpperBound = Q3_grade + 1.5 * IQR;
    IF grade < LowerBound OR grade > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = grade;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_grade Q3_grade;
RUN;

/* Print detected outliers for 'grade' */
PROC PRINT DATA=OutliersListGrade;
RUN;

/* Visualize 'grade' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX grade;
RUN;



/* Create a new dataset with the filtered observations */
data filtered_data;
    set house;
    if sqft_lot in (389126, 478288, 435600, 920423, 368517, 336283, 443440, 499571, 533610, 415126, 403365, 321908);
run;

/* Print the filtered observations */
proc print data=filtered_data; 
run;


/* condition VARIABLE */
* Compute quartiles for the 'condition' variable;
PROC UNIVARIATE DATA=house;
    VAR condition;
    OUTPUT OUT=OutliersCondition (RENAME=(condition=OriginalCondition))
    Q1=Q1_condition Q3=Q3_condition;
RUN;

* Detect and store outliers for 'condition' in a new dataset;
DATA OutliersListCondition (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersCondition;
    IQR = Q3_condition - Q1_condition;
    LowerBound = Q1_condition - 1.5 * IQR;
    UpperBound = Q3_condition + 1.5 * IQR;
    IF condition < LowerBound OR condition > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = condition;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_condition Q3_condition;
RUN;

* Print detected outliers for 'condition';
PROC PRINT DATA=OutliersListCondition;
RUN;

* Visualize 'condition' distribution with a boxplot;
PROC SGPLOT DATA=house;
    VBOX condition;
RUN;



/* view VARIABLE */
/* Compute quartiles for the 'view' variable */
PROC UNIVARIATE DATA=house;
    VAR view;
    OUTPUT OUT=OutliersView (RENAME=(view=OriginalView))
    Q1=Q1_view Q3=Q3_view;
RUN;

/* Detect and store outliers for 'view' in a new dataset */
DATA OutliersListView (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersView;
    IQR = Q3_view - Q1_view;
    LowerBound = Q1_view - 1.5 * IQR;
    UpperBound = Q3_view + 1.5 * IQR;
    IF view < LowerBound OR view > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = view;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_view Q3_view;
RUN;

/* Print detected outliers for 'view' */
PROC PRINT DATA=OutliersListView;
RUN;

/* Visualize 'view' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX view;
RUN;

/* floors VARIABLE */
/* Compute quartiles for the 'floors' variable */
PROC UNIVARIATE DATA=house;
    VAR floors;
    OUTPUT OUT=OutliersFloors (RENAME=(floors=OriginalFloors))
    Q1=Q1_floors Q3=Q3_floors;
RUN;

/* Detect and store outliers for 'floors' in a new dataset */
DATA OutliersListFloors (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersFloors;
    IQR = Q3_floors - Q1_floors;
    LowerBound = Q1_floors - 1.5 * IQR;
    UpperBound = Q3_floors + 1.5 * IQR;
    IF floors < LowerBound OR floors > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = floors;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_floors Q3_floors;
RUN;

/* Print detected outliers for 'floors' */
PROC PRINT DATA=OutliersListFloors;
RUN;

/* Visualize 'floors' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX floors;
RUN;

/* waterfront VARIABLE */
/* Compute quartiles for the 'waterfront' variable */
PROC UNIVARIATE DATA=house;
    VAR waterfront;
    OUTPUT OUT=OutliersWaterfront (RENAME=(waterfront=OriginalWaterfront))
    Q1=Q1_waterfront Q3=Q3_waterfront;
RUN;

/* Detect and store outliers for 'waterfront' in a new dataset */
DATA OutliersListWaterfront (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersWaterfront;
    IQR = Q3_waterfront - Q1_waterfront;
    LowerBound = Q1_waterfront - 1.5 * IQR;
    UpperBound = Q3_waterfront + 1.5 * IQR;
    IF waterfront < LowerBound OR waterfront > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = waterfront;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_waterfront Q3_waterfront;
RUN;

/* Print detected outliers for 'waterfront' */
PROC PRINT DATA=OutliersListWaterfront;
RUN;

/* Visualize 'waterfront' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX waterfront;
RUN;

/* sqft_above VARIABLE */
/* Compute quartiles for the 'sqft_above' variable */
PROC UNIVARIATE DATA=house;
    VAR sqft_above;
    OUTPUT OUT=OutliersSqftAbove (RENAME=(sqft_above=OriginalSqftAbove))
    Q1=Q1_sqft_above Q3=Q3_sqft_above;
RUN;

/* Detect and store outliers for 'sqft_above' in a new dataset */
DATA OutliersListSqftAbove (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersSqftAbove;
    IQR = Q3_sqft_above - Q1_sqft_above;
    LowerBound = Q1_sqft_above - 1.5 * IQR;
    UpperBound = Q3_sqft_above + 1.5 * IQR;
    IF sqft_above < LowerBound OR sqft_above > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = sqft_above;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_sqft_above Q3_sqft_above;
RUN;

/* Print detected outliers for 'sqft_above' */
PROC PRINT DATA=OutliersListSqftAbove;
RUN;

/* Visualize 'sqft_above' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX sqft_above;
RUN;

/* sqft_basement VARIABLE */
/* Compute quartiles for the 'sqft_basement' variable */
PROC UNIVARIATE DATA=house;
    VAR sqft_basement;
    OUTPUT OUT=OutliersSqftBasement (RENAME=(sqft_basement=OriginalSqftBasement))
    Q1=Q1_sqft_basement Q3=Q3_sqft_basement;
RUN;

/* Detect and store outliers for 'sqft_basement' in a new dataset */
DATA OutliersListSqftBasement (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersSqftBasement;
    IQR = Q3_sqft_basement - Q1_sqft_basement;
    LowerBound = Q1_sqft_basement - 1.5 * IQR;
    UpperBound = Q3_sqft_basement + 1.5 * IQR;
    IF sqft_basement < LowerBound OR sqft_basement > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = sqft_basement;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_sqft_basement Q3_sqft_basement;
RUN;

/* Print detected outliers for 'sqft_basement' */
PROC PRINT DATA=OutliersListSqftBasement;
RUN;

/* Visualize 'sqft_basement' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX sqft_basement;
RUN;

/* yr_built VARIABLE */
/* Compute quartiles for the 'yr_built' variable */
PROC UNIVARIATE DATA=house;
    VAR yr_built;
    OUTPUT OUT=OutliersYrBuilt (RENAME=(yr_built=OriginalYrBuilt))
    Q1=Q1_yr_built Q3=Q3_yr_built;
RUN;

/* Detect and store outliers for 'yr_built' in a new dataset */
DATA OutliersListYrBuilt (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersYrBuilt;
    IQR = Q3_yr_built - Q1_yr_built;
    LowerBound = Q1_yr_built - 1.5 * IQR;
    UpperBound = Q3_yr_built + 1.5 * IQR;
    IF yr_built < LowerBound OR yr_built > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = yr_built;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_yr_built Q3_yr_built;
RUN;

/* Print detected outliers for 'yr_built' */
PROC PRINT DATA=OutliersListYrBuilt;
RUN;

/* Visualize 'yr_built' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX yr_built;
RUN;


/* lat VARIABLE */
/* Compute quartiles for the 'lat' variable */
PROC UNIVARIATE DATA=house;
    VAR lat;
    OUTPUT OUT=OutliersLat (RENAME=(lat=OriginalLat))
    Q1=Q1_lat Q3=Q3_lat;
RUN;

/* Detect and store outliers for 'lat' in a new dataset */
DATA OutliersListLat (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersLat;
    IQR = Q3_lat - Q1_lat;
    LowerBound = Q1_lat - 1.5 * IQR;
    UpperBound = Q3_lat + 1.5 * IQR;
    IF lat < LowerBound OR lat > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = lat;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_lat Q3_lat;
RUN;

/* Print detected outliers for 'lat' */
PROC PRINT DATA=OutliersListLat;
RUN;

/* Visualize 'lat' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX lat;
RUN;

/* long VARIABLE */
/* Compute quartiles for the 'long' variable */
PROC UNIVARIATE DATA=house;
    VAR long;
    OUTPUT OUT=OutliersLong (RENAME=(long=OriginalLong))
    Q1=Q1_long Q3=Q3_long;
RUN;

/* Detect and store outliers for 'long' in a new dataset */
DATA OutliersListLong (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersLong;
    IQR = Q3_long - Q1_long;
    LowerBound = Q1_long - 1.5 * IQR;
    UpperBound = Q3_long + 1.5 * IQR;
    IF long < LowerBound OR long > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = long;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_long Q3_long;
RUN;

/* Print detected outliers for 'long' */
PROC PRINT DATA=OutliersListLong;
RUN;

/* Visualize 'long' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX long;
RUN;

/* sqft_living15 VARIABLE */
/* Compute quartiles for the 'sqft_living15' variable */
PROC UNIVARIATE DATA=house;
    VAR sqft_living15;
    OUTPUT OUT=OutliersSqftLiving15 (RENAME=(sqft_living15=OriginalSqftLiving15))
    Q1=Q1_sqft_living15 Q3=Q3_sqft_living15;
RUN;

/* Detect and store outliers for 'sqft_living15' in a new dataset */
DATA OutliersListSqftLiving15 (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersSqftLiving15;
    IQR = Q3_sqft_living15 - Q1_sqft_living15;
    LowerBound = Q1_sqft_living15 - 1.5 * IQR;
    UpperBound = Q3_sqft_living15 + 1.5 * IQR;
    IF sqft_living15 < LowerBound OR sqft_living15 > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = sqft_living15;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_sqft_living15 Q3_sqft_living15;
RUN;

/* Print detected outliers for 'sqft_living15' */
PROC PRINT DATA=OutliersListSqftLiving15;
RUN;

/* Visualize 'sqft_living15' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX sqft_living15;
RUN;



/* sqft_lot15 VARIABLE */
/* Compute quartiles for the 'sqft_lot15' variable */
PROC UNIVARIATE DATA=house;
    VAR sqft_lot15;
    OUTPUT OUT=OutliersSqftLot15 (RENAME=(sqft_lot15=OriginalSqftLot15))
    Q1=Q1_sqft_lot15 Q3=Q3_sqft_lot15;
RUN;

/* Detect and store outliers for 'sqft_lot15' in a new dataset */
DATA OutliersListSqftLot15 (keep=ObsNum OutlierValue);
    SET house;
    IF _N_ = 1 THEN SET OutliersSqftLot15;
    IQR = Q3_sqft_lot15 - Q1_sqft_lot15;
    LowerBound = Q1_sqft_lot15 - 1.5 * IQR;
    UpperBound = Q3_sqft_lot15 + 1.5 * IQR;
    IF sqft_lot15 < LowerBound OR sqft_lot15 > UpperBound THEN DO;
        ObsNum = _N_;
        OutlierValue = sqft_lot15;
        OUTPUT;
    END;
    DROP IQR LowerBound UpperBound Q1_sqft_lot15 Q3_sqft_lot15;
RUN;

/* Print detected outliers for 'sqft_lot15' */
PROC PRINT DATA=OutliersListSqftLot15;
RUN;

/* Visualize 'sqft_lot15' distribution with a boxplot */
PROC SGPLOT DATA=house;
    VBOX sqft_lot15;
RUN;







