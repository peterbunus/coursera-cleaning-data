library(data.table)

## checks if the UCI HAR dataset is present in the same directory

data_directory <- "UCI HAR dataset"
if (!file.exists(data_directory)){
  error_message <- paste("There is no directory called ", data_directory)
  print(error_message)
}

## 1 Merges the training and the test sets to create one data set.
##################################################################
## read the train data set
path_X_train <- paste("./", data_directory, "/train/X_train.txt", sep="")
X_train_data <- read.table(path_X_train)
path_Y_train <- paste("./", data_directory, "/train/y_train.txt", sep="")
Y_train_data <- read.table(path_Y_train)
path_S_train <- paste("./", data_directory, "/train/subject_train.txt", sep="")
S_train_data <- read.table(path_S_train)

## read the test data set
path_X_test <- paste("./", data_directory, "/test/X_test.txt", sep="")
X_test_data <- read.table(path_X_test)
path_Y_test <- paste("./", data_directory, "/test/y_test.txt", sep="")
Y_test_data <- read.table(path_Y_test)
path_S_test <- paste("./", data_directory, "/test/subject_test.txt", sep="")
S_test_data <- read.table(path_S_test)

##merge the datasets
X_data <- rbind(X_train_data,X_test_data)
Y_data <- rbind(Y_train_data,Y_test_data)
S_data <- rbind(S_train_data,S_test_data)


## 2 Extracts only the measurements on the mean and standard deviation for each measurement.
##################################################################
## read the features 
path_features <- paste("./", data_directory, "/features.txt", sep="")
features_data <- read.table(path_features)
##extract from the feature_data only the rows that contains the word "mean" and "std"
features_mean_std <- subset(features_data,  grepl("(mean\\(\\)|std\\(\\))", features_data$V2) )
features_mean_std_row_index <- features_mean_std[,2]
names(X_data) <- features_data$V2
M_data_mean_std <- X_data[,features_mean_std_row_index]



## 3 Uses descriptive activity names to name the activities in the data set
##################################################################
##read the activity labels
path_activity_labels <- paste("./", data_directory, "/activity_labels.txt", sep="")
activity_labels_data <- read.table(path_activity_labels)
Y_data[,1] = activity_labels_data[Y_data[,1], 2]


## 4 Appropriately labels the data set with descriptive variable names. 
##################################################################
names(Y_data) <- "Activity"  
names(S_data) <- "Subject" 
## the merged data
M_data <-cbind(X_data,Y_data,S_data)
M_data_mean_std <- cbind(M_data_mean_std,Y_data,S_data)


## 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##################################################################
## transform the M_data_mean_std to a data table
DT <- data.table(M_data_mean_std)
tidy_mean_data <- DT[, lapply(.SD, mean), by=c("Subject", "Activity")]
tidy_mean_data <- tidy_mean_data[order(tidy_mean_data$Subject),]

#Exporting data into a file:
write.table(tidy_mean_data, "tidy_mean_data.txt", sep="\t")
