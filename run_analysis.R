# Bloc 3:
# Week 3
# Assignment 
# run_analysis.R

# library(dplyr)

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Read

# urldata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url = urldata, destfile = "dataset_original.zip", method = "curl")
# unzip("dataset_original.zip")

# temp <- tempfile()
# download.file("http://www.newcl.org/data/zipfiles/a1.zip",temp)
# data <- read.table(unz(temp, "a1.dat"))
# unlink(temp)

# setwd("/Users/Joelle/Documents/Personnel/Coursera/DataScience/Program_R/UCI HAR Dataset/test")
# X_test <- read.table("X_test.txt")
# Y_test <- read.table("Y_test.txt")
# subject_test <- read.table("subject_test.txt")
# setwd("/Users/Joelle/Documents/Personnel/Coursera/DataScience/Program_R/UCI HAR Dataset/train")
# X_train <- read.table("X_train.txt")
# Y_train <- read.table("Y_train.txt")
# subject_train <- read.table("subject_train.txt")
# setwd("/Users/Joelle/Documents/Personnel/Coursera/DataScience/Program_R/UCI HAR Dataset")
# features <- read.table("features.txt")
# activity_labels <- read.table("activity_labels.txt")


X_test <- read.table("UCI HAR Dataset/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/subject_test.txt")
X_train <- read.table("UCI HAR Dataset/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/subject_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")


datatest <- data.frame(c(X_test, subject_test, Y_test), row.names = NULL)
datatrain <- data.frame(c(X_train, subject_train, Y_train), row.names = NULL)

# Merge
datatesttrain <- rbind(datatest, datatrain)

# Extract
c_meanstd <- grepl("mean|std", features[,2])
dataextrac <- datatesttrain[,c_meanstd]

# Activity labels
for (ll in activity_labels$V1){
    dataextrac$V1.2[dataextrac$V1.2 == as.integer(ll)] <- as.character(activity_labels$V2[as.numeric(ll)])
}

# Variable names
colnames(dataextrac) <- c(as.character(features$V2[c_meanstd]), "subject_id", "activity")


# Average dataset by subject by activity
average_data <- dataextrac %>% group_by(subject_id, activity) %>% summarise_each(funs(mean))
