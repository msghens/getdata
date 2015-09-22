# Coursera Getting and Cleaning Data final project


# Step 1: Merges the training and the test sets to create one data set.
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Step 3: Uses descriptive activity names to name the activities in the data set
# Step 4: Appropriately labels the data set with descriptive variable names. 
# 
# Step 5: From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject




library(plyr)

features <- read.table("Dataset/features.txt",header=FALSE)
dataTest <- read.table("./Dataset/test/X_test.txt",header = FALSE)
dataTrain <- read.table("./Dataset/train/X_train.txt",header = FALSE)
names(dataTest) <- features$V2
names(dataTrain) <- features$V2

# mergeData <- merge(dataTrain,dataTest,by = names(features$V2))
# mergeData <- join_all(list(dataTrain,dataTest))
mergeData <- join(dataTrain,dataTest,type="full")


tidyData <- mergeData
# Step 5
write.table(tidyData,file = "tidy.txt" ,row.names = FALSE)
