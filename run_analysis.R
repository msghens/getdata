# Coursera Getting and Cleaning Data final project


# Step 1: Merges the training and the test sets to create one data set.
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Step 3: Uses descriptive activity names to name the activities in the data set
# Step 4: Appropriately labels the data set with descriptive variable names.
#
# Step 5: From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject




library(plyr)
#Load feature set
features <- read.table("Dataset/features.txt",header = FALSE)

# Load test data
X_test <- read.table("./Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("./Dataset/test/y_test.txt",header = FALSE)

# Load training data
X_train <- read.table("./Dataset/train/X_train.txt",header = FALSE)
y_train <-
    read.table("./Dataset/train/y_train.txt",header = FALSE)


names(X_test) <- features$V2
names(X_train) <- features$V2

# mergeData <- merge(X_train,X_test,by = names(features$V2))
# mergeData <- join_all(list(X_train,X_test))
mergeData <- join(X_train,X_test,type = "full")


tidyData <- mergeData
# Step 5
write.table(tidyData,file = "tidy.txt" ,row.names = FALSE)
