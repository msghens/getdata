# Coursera Getting and Cleaning Data final project


# Step 1: Merges the training and the test sets to create one data set.
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Step 3: Uses descriptive activity names to name the activities in the data set
# Step 4: Appropriately labels the data set with descriptive variable names.
# Step 5: From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject




library(dplyr)
#Load feature set
features <- read.table("Dataset/features.txt",header = FALSE)

# Load test data
X_test <- read.table("./Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("./Dataset/test/y_test.txt",header = FALSE)
subject_test <-
  read.table("Dataset/test/subject_test.txt",header = FALSE)

#Header Name
names(X_test) <- features$V2
names(y_test) <- "activity"
names(subject_test) <- "subject"

#get only mean/std collums
X_test <- X_test[,grep('mean\\(\\)|std\\(\\)',names(X_test))]

#stich datata together for test
testdata <- cbind(subject_test,y_test,X_test)


#release data from memory
rm(subject_test)
rm(y_test)
rm(X_test)

# Load training data
X_train <- read.table("./Dataset/train/X_train.txt",header = FALSE)
y_train <-
  read.table("./Dataset/train/y_train.txt",header = FALSE)
subject_train <-
  read.table("Dataset/train/subject_train.txt",header = FALSE)

#Label the colums
names(X_train) <- features$V2
names(y_train) <- "activity"
names(subject_train) <- "subject"

#get only mean()/()std collums
X_train <- X_train[,grep('mean\\(\\)|std\\(\\)',names(X_train))]

#stich train data
traindata <- cbind(subject_train,y_train,X_train)

#Release memmory
rm(subject_train)
rm(y_train)
rm(X_train)
rm(features)

#combine Train adn Test data Sets
dirtydata <- rbind(traindata,testdata)

#Load activity labels
activity_label <-
  read.table("Dataset/activity_labels.txt",header = FALSE,stringsAsFactors =
               FALSE)
names(activity_label) <- c("activity","label")

# library(dplyr)


dirtydata <- merge(activity_label,dirtydata,by = "activity")
# mergeData <- join_all(list(X_train,X_test))
# mergeData <- join(X_train,X_test,type = "full")

#remove the activity collumn
dirtydata$activity <- NULL



# Step 5

library(reshape2)
#first version of tidy data
tidyData <- melt(dirtydata,id = c("subject","label"))
# Get means
tidyData <- dcast(tidyData, ... ~ variable,mean)

#clean up collumn names (Week 4 suggestions)

names(tidyData) <- tolower(gsub("\\(|\\)","",names(tidyData)))

write.table(tidyData,file = "tidy.txt" ,row.names = FALSE)
