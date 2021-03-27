* Encoding: UTF-8.

*Import data from excel file*
GET DATA
  /TYPE=XLSX
  /FILE='/Users/*enter file location and file name here*.xlsx'
  /SHEET=name 'Sheet1' *enter sheet name here*
  /CELLRANGE=FULL
  /READNAMES=ON
  /DATATYPEMIN PERCENTAGE=95.0
  /HIDDEN IGNORE=YES.
*EXECUTE.*
*DATASET NAME DataSet1 WINDOW=FRONT.*

*Alternatively go to File > Import Data > Excel*
*or drag the excel file and drop it on SPSS dialog box*

DATASET ACTIVATE DataSet1.

**************************************Step 1: Data Cleaning *****************************************************************
1a. Check for out of range responses
*Generate frequency tables to checking for out of range items*

FREQUENCIES VARIABLES=A1 A2a A2b A2c A2d A2e A2f A3 A4 A5 A6a A6b A6c A6d A6e A6f A7a A7b A7c A7d A8    
  /ORDER=ANALYSIS.

***************************************Step 1: Data Cleaning****************************************************************
1b. Convert String variables to numeric*

RECODE A1 (CONVERT) ('Poor'=1) ('Fair'=2) ('Good'=3) ('Very good'=4) ('Excellent'=5) INTO Q1.
VARIABLE LABELS  Q1 'Q1_Numeric'.

RECODE A2a (CONVERT) ('Limited for more than 3 months'=1) ('Limited for 3 months or less'=2) ('Not limited at all'=3) INTO Q2a.
VARIABLE LABELS  Q2a 'Q2a_Numeric'.
RECODE A2b (CONVERT) ('Limited for more than 3 months'=1) ('Limited for 3 months or less'=2) ('Not limited at all'=3) INTO Q2b.
VARIABLE LABELS  Q2b 'Q2b_Numeric'.
RECODE A2c (CONVERT) ('Limited for more than 3 months'=1) ('Limited for 3 months or less'=2) ('Not limited at all'=3) INTO Q2c.
VARIABLE LABELS  Q2c 'Q2c_Numeric'.
RECODE A2d (CONVERT) ('Limited for more than 3 months'=1) ('Limited for 3 months or less'=2) ('Not limited at all'=3) INTO Q2d.
VARIABLE LABELS  Q2d 'Q2d_Numeric'.
RECODE A2e (CONVERT) ('Limited for more than 3 months'=1) ('Limited for 3 months or less'=2) ('Not limited at all'=3) INTO Q2e.
VARIABLE LABELS  Q2e 'Q2e_Numeric'.
RECODE A2f (CONVERT) ('Limited for more than 3 months'=1) ('Limited for 3 months or less'=2) ('Not limited at all'=3) INTO Q2f.
VARIABLE LABELS  Q2f 'Q2f_Numeric'.

RECODE A3 (CONVERT) ('None'=1) ('Very mild'=2) ('Mild'=3) ('Moderate'=4) ('Severe'=5) ('Very severe'=6) INTO Q3.
VARIABLE LABELS  Q3 'Q3_Numeric'.

RECODE A4 (CONVERT) ('Yes, for more than 3 months'=1) ('Yes, for 3 months or less'=2) ('No'=3) INTO Q4.
VARIABLE LABELS  Q4 'Q4_Numeric'.

RECODE A5 (CONVERT) ('Yes, for more than 3 months'=1) ('Yes, for 3 months or less'=2) ('No'=3) INTO Q5.
VARIABLE LABELS  Q5 'Q5_Numeric'.

RECODE A6a (CONVERT) ('All of the time'=1) ('Most of the time'=2) ('A good bit of the time'=3) ('Some of the time'=4) ('A little of the time'=5) ('None of the time'=6) INTO Q6a.
VARIABLE LABELS  Q6a 'Q6a_Numeric'.
RECODE A6b (CONVERT) ('All of the time'=1) ('Most of the time'=2) ('A good bit of the time'=3) ('Some of the time'=4) ('A little of the time'=5) ('None of the time'=6) INTO Q6b.
VARIABLE LABELS  Q6b 'Q6b_Numeric'.
RECODE A6c (CONVERT) ('All of the time'=1) ('Most of the time'=2) ('A good bit of the time'=3) ('Some of the time'=4) ('A little of the time'=5) ('None of the time'=6) INTO Q6c.
VARIABLE LABELS  Q6c 'Q6c_Numeric'.
RECODE A6d (CONVERT) ('All of the time'=1) ('Most of the time'=2) ('A good bit of the time'=3) ('Some of the time'=4) ('A little of the time'=5) ('None of the time'=6) INTO Q6d.
VARIABLE LABELS  Q6d 'Q6d_Numeric'.
RECODE A6e (CONVERT) ('All of the time'=1) ('Most of the time'=2) ('A good bit of the time'=3) ('Some of the time'=4) ('A little of the time'=5) ('None of the time'=6) INTO Q6e.
VARIABLE LABELS  Q6e 'Q6e_Numeric'.
RECODE A6f (CONVERT) ('All of the time'=1) ('Most of the time'=2) ('A good bit of the time'=3) ('Some of the time'=4) ('A little of the time'=5) ('None of the time'=6) INTO Q6f.
VARIABLE LABELS  Q6f 'Q6f_Numeric'.

RECODE A7a (CONVERT) ('Definitely true'=1) ('Mostly true'=2) ('Not sure'=3) ('Mostly false'=4) ('Definitely false'=5) INTO Q7a.
VARIABLE LABELS  Q7a 'Q7a_Numeric'.
RECODE A7b (CONVERT) ('Definitely true'=1) ('Mostly true'=2) ('Not sure'=3) ('Mostly false'=4) ('Definitely false'=5) INTO Q7b.
VARIABLE LABELS  Q7b 'Q7b_Numeric'.
RECODE A7c (CONVERT) ('Definitely true'=1) ('Mostly true'=2) ('Not sure'=3) ('Mostly false'=4) ('Definitely false'=5) INTO Q7c.
VARIABLE LABELS  Q7c 'Q7c_Numeric'.
RECODE A7d (CONVERT) ('Definitely true'=1) ('Mostly true'=2) ('Not sure'=3) ('Mostly false'=4) ('Definitely false'=5) INTO Q7d.
VARIABLE LABELS  Q7d 'Q7d_Numeric'.

RECODE A8 (CONVERT) ('Poor'=1) ('Fair'=2) ('Good'=3) ('Very good'=4) ('Excellent'=5) INTO Q8.
VARIABLE LABELS  Q8 'Q8_Numeric'.
EXECUTE.

*Step 2 Recoding & Item Recalibration******************************************************************
*Item Recalibration where, 1 = 5, 2 = 4.36, 3 = 3.43, 4 = 1.99, 5 = 1. to better reflect the unven intervals
*Q1 to be recailbrated abbreviated by RC (following SAS Manual abbreviation) *

RECODE Q1 (1=5) (4=1.99) (3=3.43) (2=4.36) (5=1) INTO Q1RE.
VARIABLE LABELS  Q1RE 'Q1 Recalibrated'.




*Step 3 Reverse scoring of items where higher scores indicate better functioning************************
*Reverse code where, 1 = 5, 2 = 4, 3 = 3, 4 =2, 5 =1*
*Q3, Q6ce, Q7bc, Q8 abbreviated by RV*

RECODE Q3 (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) INTO Q3RV.
VARIABLE LABELS  Q3RV 'Q3 Reverse coded'.

RECODE Q6c (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) INTO Q6cRV.
VARIABLE LABELS  Q6cRV 'Q6c Reverse coded'.
RECODE Q6e (1=6) (2=5) (3=4) (4=3) (5=2) (6=1) INTO Q6eRV.
VARIABLE LABELS  Q6eRV 'Q6e Reverse coded'.

RECODE Q7b (1=5) (2=4) (3=3) (4=2) (5=1) INTO Q7bRV.
VARIABLE LABELS  Q7bRV 'Q7b Reverse coded'.
RECODE Q7c (1=5) (2=4) (3=3) (4=2) (5=1) INTO Q7cRV.
VARIABLE LABELS  Q7cRV 'Q7c Reverse coded'.

RECODE Q8 (1=5) (2=4) (3=3) (4=2) (5=1) INTO Q8RV.
VARIABLE LABELS  Q8RV 'Q8 Reverse coded'.

EXECUTE.

*Step 4: Transforming item scores linearly to a common metric with a possible range of 0-100
*6-point Likert : (Response -1) x20*
*5-point Likert : (Response -1) x25*
*3-point Likert : (Response -1) x50*

*6-point Likert : (Response -1) x20*

COMPUTE Q3_Transformed=(Q3RV - 1) * 20.
COMPUTE Q6a_Transformed=(Q6a - 1) * 20.
COMPUTE Q6b_Transformed=(Q6b - 1) * 20.
COMPUTE Q6c_Transformed=(Q6cRV - 1) * 20.
COMPUTE Q6d_Transformed=(Q6d - 1) * 20.
COMPUTE Q6e_Transformed=(Q6eRV - 1) * 20.
COMPUTE Q6f_Transformed=(Q6f - 1) * 20.


*5-point Likert : (Response -1) x25*

COMPUTE Q1_Transformed=(Q1RE - 1) * 25.
COMPUTE Q7a_Transformed=(Q7a - 1) * 25.
COMPUTE Q7b_Transformed=(Q7bRV - 1) * 25.
COMPUTE Q7c_Transformed=(Q7cRV - 1) * 25.
COMPUTE Q7d_Transformed=(Q7d - 1) * 25.

COMPUTE Q8_Transformed=(Q8 - 1) * 25.
EXECUTE.

*3-point Likert : (Response -1) x50*

COMPUTE Q2a_Transformed=(Q2a - 1) * 50.
COMPUTE Q2b_Transformed=(Q2b - 1) * 50.
COMPUTE Q2c_Transformed=(Q2c - 1) * 50.
COMPUTE Q2d_Transformed=(Q2d - 1) * 50.
COMPUTE Q2e_Transformed=(Q2e - 1) * 50.
COMPUTE Q2f_Transformed=(Q2f - 1) * 50.

COMPUTE Q4_Transformed=(Q4 - 1) * 50.
COMPUTE Q5_Transformed=(Q5 - 1) * 50.
EXECUTE.

*Step 5: averaging across items in the same scale.*
*Domain1: Physical Functioning: Q2abcdef*
*Domain2: Role Functioning: Q4 + Q5*
*Domain3: Social Functioning: Q6a*
*Domain4: Mental Health: Q6bcdef*
*Domain5: Health Perceptions: Q1, Q7abcd*
*Domain6: Pain Q3*
*Extra Q8*

COMPUTE Domain1_Physical=MEAN(Q2a_Transformed, 
    Q2b_Transformed,Q2c_Transformed,Q2d_Transformed,Q2e_Transformed,Q2f_Transformed).
VARIABLE LABELS  Domain1_Physical 'Physical Functioning'.

COMPUTE Domain2_Role=MEAN(Q4_Transformed, 
    Q5_Transformed).
VARIABLE LABELS  Domain2_Role 'Role Functioning'.

COMPUTE Domain3_Social=MEAN(Q6a_Transformed).
VARIABLE LABELS  Domain3_Social 'Social Functioning'.

COMPUTE Domain4_Mental=MEAN(Q6b_Transformed, 
    Q6c_Transformed,Q6d_Transformed,Q6e_Transformed,Q6f_Transformed).
VARIABLE LABELS  Domain4_Mental 'Mental Health'.

COMPUTE Domain5_Health=MEAN(Q7a_Transformed, 
    Q7b_Transformed,Q7c_Transformed,Q7d_Transformed,Q1_Transformed).
VARIABLE LABELS  Domain5_Health 'Health Perceptions'.

COMPUTE Domain6_Pain=MEAN(Q3_Transformed).
VARIABLE LABELS  Domain6_Pain 'Pain'.

COMPUTE Domain7_Extra=MEAN(Q8_Transformed).
VARIABLE LABELS  Domain7_Extra 'Extra'.
EXECUTE.

*Descriptive Statistics of the linear transformed item scores*

DESCRIPTIVES VARIABLES=Q3_Transformed Q6a_Transformed Q6b_Transformed Q6c_Transformed 
    Q6d_Transformed Q6e_Transformed Q6f_Transformed Q1_Transformed Q7a_Transformed Q7b_Transformed 
    Q7c_Transformed Q7d_Transformed Q8_Transformed Q2a_Transformed Q2b_Transformed Q2c_Transformed 
    Q2d_Transformed Q2e_Transformed Q2f_Transformed Q4_Transformed Q5_Transformed
  /STATISTICS=MEAN STDDEV MIN MAX
  /SORT=NAME (A).

*Descriptive Statistics of the domain scores*

DESCRIPTIVES VARIABLES=Domain1_Physical Domain2_Role Domain3_Social Domain4_Mental Domain5_Health 
    Domain6_Pain Domain7_Extra
  /STATISTICS=MEAN STDDEV MIN MAX.
