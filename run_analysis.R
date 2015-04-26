if(!file.exists("CP_data")){dir.create("CP_data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./CP_data/Dataset.zip", method="curl")
dateDownloaded <- date()
library(downloader)
unzip(zipfile="./CP_data/Dataset.zip", exdir="./CP_data")
loc_data <- file.path("./CP_data", "UCI HAR Dataset")
files <- list.files(loc_data, recursive=TRUE)
files

//Read Activity data from files into variables
ActivityTestDT <- read.table(file.path(loc_data,"test", "y_test.txt"))
ActivityTrainDT <- read.table(file.path(loc_data, "train", "y_train.txt"))

//Read Features data from files into variables
FeaturesTestDT <- read.table(file.path(loc_data,"test", "X_test.txt"))
FeaturesTrainDT <- read.table(file.path(loc_data, "train", "X_train.txt"))

//Read Subject data from files into variables
SubjectTestDT <- read.table(file.path(loc_data,"test", "subject_test.txt"))
SubjectTrainDT <- read.table(file.path(loc_data, "train", "subject_train.txt"))

//Display the structure of these tables
str(ActivityTestDT)
str(ActivityTrainDT)

str(FeaturesTestDT)
str(FeaturesTrainDT)

str(SubjectTestDT)
str(SubjectTrainDT)

//Merging test and train data set
ActivityDS <- rbind(ActivityTrainDT, ActivityTestDT)
FeaturesDS <- rbind(FeaturesTrainDT, FeaturesTestDT)
SubjectDS <- rbind(SubjectTrainDT, SubjectTestDT)

//set names to variables
names(ActivityDS) <- c("Activity")
names(SubjectDS) <- c("Subject")
FeaturesDN <- read.table(file.path(loc_data, "features.txt"), head=FALSE)
names(FeaturesDS) <- FeaturesDN$V2

//Use cbind to merge the columns from all tables
SubActDS <- cbind(SubjectDS, ActivityDS)
CombinedDS <- cbind(FeaturesDS, SubActDS)

//Extraction of mean and Std deviation of each measurement by grepping them
FeaturesDNSubset <- FeaturesDN$V2[grep("mean\\(\\)|std\\(\\)", FeaturesDN$V2)]

//Select names of Features by subsetting data frame
FeaturesNames <- c(as.character(FeaturesDNSubset), "Subject", "Activity")
CombinedDS <- subset(CombinedDS, select=FeaturesNames)

//Display data frame structure
str(CombinedDS)


//Use descriptive activity names to name activities in the data set
activityLabels <- read.table(file.path(loc_data, "activity_labels.txt"),header = FALSE)

CombinedDS$Activity <- activityLabels[CombinedDS$Activity, 2]

head(CombinedDS$Activity, 50)

//Appropriately label the data set with descriptive variable names

names(CombinedDS)<-gsub("Acc", "Accelerometer", names(CombinedDS))
names(CombinedDS)<-gsub("BodyBody", "Body", names(CombinedDS))
names(CombinedDS)<-gsub("^f", "frequency", names(CombinedDS))
names(CombinedDS)<-gsub("Gyro", "Gyroscope", names(CombinedDS))
names(CombinedDS)<-gsub("Mag", "Magnitude", names(CombinedDS))
names(CombinedDS)<-gsub("^t", "time", names(CombinedDS))


names(CombinedDS)
//Create an independent tidy data set with average of each varaible for each activity and each subject
library(plyr)
FinalDS <- aggregate(. ~Subject+Activity, CombinedDS, mean)
FinalDS <- FinalDS[order(FinalDS$Subject, FinalDS$Activity), ]

write.table(FinalDS, file="tidyData.txt", row.name=FALSE)
