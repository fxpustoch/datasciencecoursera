library(plyr)
# set the variable for the study

setwd("~/R/Coursera/")
fileName <- "UCIdata.zip"
urlAddress <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

# download the file then unzip the file
#download.file(urlAddress,fileName, mode = "wb") 
#unzip(fileName, files = NULL, exdir=".")

## Load all the data from the UCI folder
X_test <- read.table("UCI HAR Dataset/test/X_test.txt") # 2947 x 561
X_train <- read.table("UCI HAR Dataset/train/X_train.txt") # 7352 x 561

y_test <- read.table("UCI HAR Dataset/test/y_test.txt") # 2947 x 1
y_train <- read.table("UCI HAR Dataset/train/y_train.txt") # 7352 x 1

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt") # 2947 x 1
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") # 7352 x 1

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt") # 6 x 2
features_labels <- read.table("UCI HAR Dataset/features.txt") # 561 x 2

# Merges the training and the test sets to create one data set.
# 10,299 = 2,947 + 7,352
subject <- rbind(subject_train, subject_test) # 10,299 x 1
features <- rbind(X_train, X_test) # 10,299 x 561
activity <- rbind(y_train,y_test) # 10,299 x 1

# names the columns
colnames(subject) <- "Subject"
colnames(features) <- t(features_labels[2])
colnames(activity) <- "Activity"

# merge everything by a column binding
# 563 = 561 + 1 + 1
fullData <- cbind(subject,features, activity) # 10,299 x 563

# Extracts only the measurements on the mean and standard deviation for each measurement.
# filter on the features but keep the subject code and the activity on each extremity

filterMeanStd <- c(grep(".*mean.*|.*std.*", names(fullData), ignore.case = TRUE), 1, 563) 
# important to add the ignore.case to specify that a pattern should ignore the case of matches
# https://www.rdocumentation.org/packages/stringr/versions/0.6.2/topics/ignore.case
filteredData <- fullData[, filterMeanStd] # 10,299 x 88

# Uses descriptive activity names to name the activities in the data set
filteredData$Activity <- as.character(filteredData$Activity)
# matching the number with the activity label
for (i in 1:6)
{
    filteredData$Activity[filteredData$Activity == i] <- as.character(activity_labels[i,2])
}

#Appropriately labels the data set with descriptive variable names

# check the list of names
#print(names(filteredData))
# we can see some abbreviations : Acc, Gyro
# change the prefix
names(filteredData) <-gsub("^t", "Time", names(filteredData))
names(filteredData) <- gsub("^f", "Frequency", names(filteredData))

names(filteredData) <-gsub("Acc", "Accelerometer", names(filteredData))
names(filteredData) <-gsub("Gyro", "Gyroscope", names(filteredData))
names(filteredData) <-gsub("BodyBody", "Body", names(filteredData))
names(filteredData) <-gsub("Mag", "Magnitude", names(filteredData))

# check the list of names
#print(names(filteredData))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- ddply(filteredData, c("Subject","Activity"), numcolwise(mean))

#print(tidyData)

write.table(tidyData,file="tidyData.txt",row.name=FALSE)
