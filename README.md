# GettingCleaningData
Coursera Getting and Cleaning Data course project:
This repository is created to fulfill the requirements of the course project for Getting and Cleaning Data, part of the Data Science specialization.

This repository contains the following files:
README.md
CodeBook.md - Describing the data fields and their contents
run_analysis.R - code to combine and summarize the data

The run_analysis code simply combines the data horizontally and vertically and creates a table of summarized averages for the feature averages (over the period of time measured at 50Hz) of Body Acceleration for each subject and their activity. 

The program run_analysis.R reads in the data from the individual text files provided by the authors of the study, combines them, labels them. Then, it merges and summarizes so that one has a data set showing the averages of the measurements.

The final data set created, all.data.smry contains the following fields: subject_id - an ID (integer) of each of the 30 people involved in the study activity - text name of the activity performed (e.g. WALKING_UPSTAIRS) mn.TimeBodyAcc_mean_X - The average of the average (over the time recorded) body acceleration in the X axis mn.TimeBodyAcc_mean_Y - The average of the average (over the time recorded) body acceleration in the Y axis mn.TimeBodyAcc_mean_Z - The average of the average (over the time recorded) body acceleration in the Z axis mn.TimeBodyAcc_std_X - The average of the standard deviation (over the time recorded) body acceleration in the X axis mn.TimeBodyAcc_std_Y - The average of the standard deviation (over the time recorded) body acceleration in the Y axis mn.TimeBodyAcc_std_Z - The average of the standard deviation (over the time recorded) body acceleration in the Z axis

The units are in the scale [-1,1] becauase they are normalized.

Steps performed:

Load all relevent data from the text files available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Assign column names

Combine data horizontally to pair labels of subjects and activities with their names

Clean column names to remove parenthesis and dashes

Create a summary table with averages grouped by subject_id and activity

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
