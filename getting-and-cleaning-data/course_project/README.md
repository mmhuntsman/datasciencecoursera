Getting and Cleaning Data - Course Project Dataset Results
==========================================================

This is the course project results for the 'Getting and Cleaning Data' course offered by Johns Hopkins University hosted on Coursera.org.

Objective
-------
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Specifically, the project asks that a script named 'run_analysis.R' be created to do the following to the source dataset: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Source Dataset
--------------
The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the source data is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The source data already exist in this location in the 'UCI HAR Dataset' directory. However, if you wish to refresh the data from the source you can find the source data here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The source dataset directory contains files that provide column label names (features_info.txt) and column value descriptions (activity_labels.txt) that apply to both the train and test datasets.

The test and train datasets are each in their separate directories. Each directory contains similar files. 
* X_(train or test).txt - A space separated table of variables/measurements.
* y_(train or test).txt - A list of activity ids that are sequenced with the data in X_(train or test).txt
* subject_(train or test).txt - A list of participant/subject ids that are sequenced with the data in X_(train or test).txt

The data in the directories 'Inertial Signals' are not used in this project.


R Scripts
---------
run_analysis.R - This file contains the R code for this project.


Text Files
----------
course_project_step_5_tidy_data.txt - This file is the results of running run_analysis.R.

CodeBook.md - This file describes the course_project_step_5_tidy_data.txt data and transformations used in generating the data from the source datasets.


Running the Code
----------------
* Change working directory to the same location as run_analysis.R
* Run the run_analysis.R script
* Review the output file course_project_step_5_tidy_data.txt


