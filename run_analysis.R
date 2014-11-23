#
# This script:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

#
# First, make sure we start in the correct directory, all file paths are relative
# to the starting point
#
library(data.table)

setwd("C:/Users/david/datasciencecoursera/Getting and Cleaning Data/Project/cleaningdata")

# read in the list of measeurements - we'll use this later to extract just the
# measurements we want and apply appropriate column names

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt"

features <- read.table(filename, head=FALSE, col.names=c("f_no","f_name"), sep=" ")

# read in the activities - we'll use this later to convert the activity numbers in the
# measurement data to a descriptive name

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"

activities <- read.table(filename, head=FALSE, col.names=c("activity_no","activity_name"), sep=" ")


# read in the first three files from the test datasets
# and name them according to the data in the column


filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"

testsubjects <- read.table(filename, head=FALSE, col.names="subject")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"

testactivities <- read.table(filename, head=FALSE, col.names="activity")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"

testX <- read.table(filename, head=FALSE, col.names=features$f_name)

# we only need the measurements on the mean and standard deviation for each measurement so
# extract just the measurements we want 
testXmeanstd <- testX[,features[grep("mean|std\\(\\)",features$f_name),1]]


# Now combine test info into a wide data frame
testwideframe <- cbind(testsubjects, testactivities, testXmeanstd)



# read in the first three files from the training datasets
# and name them according to the data in the column


filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"

trainsubjects <- read.table(filename, head=FALSE, col.names="subject")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"

trainactivities <- read.table(filename, head=FALSE, col.names="activity")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"

trainX <- read.table(filename, head=FALSE, col.names=features$f_name)

# we only need the measurements on the mean and standard deviation for each measurement so
# extract just the measurements we want

trainXmeanstd <- trainX[,features[grep("mean|std\\(\\)",features$f_name),1]]

# Now combine train info into a wide data frame
trainwideframe <- cbind(trainsubjects, trainactivities, trainXmeanstd)

#
# Now join the test and train data frames so we have a single combined set of data
#
combined <- rbind(testwideframe, trainwideframe)


# Use descriptive activity names to name the activities in the data set

combined$activity <- factor(combined$activity, activities$activity_no, activities$activity_name)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/final.txt"

# needs converted into a data.table first so we can summarize
combinedDT <- data.table(combined)
write.table(combinedDT[, lapply(.SD,mean), by=c('subject','activity')], file = filename, sep=",", row.names=FALSE )

# all done!

