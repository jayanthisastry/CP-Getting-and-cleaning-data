Getting and Cleaning Data Course Project

Overview

The purpose of this project is to demonstrate the ability to collect, work with, clean and create a tidy data set that can be used for future analysis.
The data for this project can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Unzip this file and save it in the same folder where the below script will be created and saved.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Project Summary
The R script run_analysis.R has been created that does the following
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script processes the initial data collected from the accelerometers from the Samsung Galaxy S smartphone and generates tidyData.txt that contains the average of each variable for each activity and each subject.
Please refer to CodeBook.md file to get more information on the data and variables.
