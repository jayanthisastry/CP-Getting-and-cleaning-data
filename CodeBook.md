Description

Information about the data and variables are listed in this CodeBook

Initial and Source Data:
The Source data for this project can be downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of where the data was obtained is available at the below site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years to create the data set. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

For each record in the dataset it is provided:
•	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
•	Triaxial Angular velocity from the gyroscope.
•	A 561-feature vector with time and frequency domain variables.
•	Its activity label.
•	An identifier of the subject who carried out the experiment.

Dataset includes the following files:
•	'features_info.txt': Shows information about the variables used on the feature vector.
•	'features.txt': List of all features.
•	'activity_labels.txt': Links the class labels with their activity name.
•	'train/X_train.txt': Training set.
•	'train/y_train.txt': Training labels.
•	'test/X_test.txt': Test set.
•	'test/y_test.txt': Test labels.

Following files are available for train and test data:
•	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
Note: train/Inertial Signals files are not used for this course project.

Tidy data/Output:
1.	After downloading the zipped  file from the above URL, unzip the source data into the sub folder (say CP_data) where the run_analysis .R script will be created. 
2.	list.files will list all the files located under the above sub folder after the path is set correctly 
3.	Read the train and test data for Activity, Features and  Subject data into different variables 
4.	Display the structure for each of the above variables created 
5.	Merge test and train data tables  using rbind function  for Activity, Features and Subject to create data sets for each
6.	Set names to each of the variables created above 
7.	Merge Subject and Activity with the Features data set using cbind function 
8.	Create the processed data  by using the grep command to extract the mean and standard deviation  of each measurement 
9.	Use subset command to select the feature names 
10.	Name activities in the data set using descriptive activity names 
11.	Use gsub function to label the data set with descriptive variable names. For e.g.  tBodyAcc-std()-X will be labeled as “timeBodyAccelerometer-std()-X” 
12.	Use the aggregate function to calculate the average of each variable for each activity and subject to create the tidy data 
13.	Write the tidyData.txt in the same folder where the run_analysis.R script is stored. Hint: Need plyr data table to be loaded. 
14.	Verify tidyData.txt is created 
15.	

