#
# Merges the training and the test sets to create one data set.
#

setwd("C:/Users/david/datasciencecoursera/Getting and Cleaning Data/Project/cleaningdata")


filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt"

features <- read.table(filename, head=FALSE, col.names=c("f_no","f_name"), sep=" ")


# read in the first three files from the test datasets
# and name them according to the data in the column


filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"

testsubjects <- read.table(filename, head=FALSE, col.names="subject")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"

testactivities <- read.table(filename, head=FALSE, col.names="activity")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"

testX <- read.table(filename, head=FALSE, col.names=features$f_name)


# Now combine into a wide data frame
testwideframe <- cbind(testsubjects, testactivities, testX)



# read in the first three files from the training datasets
# and name them according to the data in the column


filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"

trainsubjects <- read.table(filename, head=FALSE, col.names="subject")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"

trainactivities <- read.table(filename, head=FALSE, col.names="activity")

filename = "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"

trainX <- read.table(filename, head=FALSE, col.names=features$f_name)


# Now combine into a wide data frame
trainwideframe <- cbind(trainsubjects, trainactivities, trainX)

# Now join the test and train data frames 

combined <- rbind(testwideframe, trainwideframe)



# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


