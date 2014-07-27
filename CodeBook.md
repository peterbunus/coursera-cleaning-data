CodeBook
========================================================

The **run_analysis.R** scripts performs the following steps to clean the data:

1. The data file shall reside in the same directory where **run_analysis.R** file resides. The script checks if the **UCI HAR dataset** is present in the same directory. If the data set is not present in the same directory an error message is output.

2. Reads the trainig data set from the *X_train.txt, Y_train.txt* and *subject_train.txt* files and the test data sets from *X_test.txt, Y_test.txt* and *subject_test.txt* files and merges the data into the following variables:
    * X_data - 10299 x 561 data frame
    * Y_data - 10299 x 1 data frame
    * S_data - 10299 x 1 data frame

3. Read the features from the *features.txt* file and extract from the feature_data only the rows that contains the word "mean" and "std". 
    * features_mean_std - contains 66 rows with the features containing the word "mean" and "std"
    
4. The *features_mean_std* is used to extract only the measurements on the mean and standard deviation for each measurement by creating the M_data_mean_std frame
    * M_data_mean_std - 10299 x 66 data frame
    
5. The activity labels are read from the **activity_labels.txt** file and the descriptive names are used  to name the activities in the Y_data data frame. The head of the Y_data data frame will look like this:
```
       V1
    1	STANDING
    2	STANDING
    3	STANDING
    .........
```

6. The X_data, Y_data and S_data are labeled with descriptive variable names. For example the head of  Y_data data frame will look like this:
```
       Activity
    1 STANDING
    2	STANDING
    3	STANDING
    .........
```

7. Y_data, and S_data labeled with descriptive variable names are apended to M_data_mean_std. M_data_mean_std has now 10299 obs x 68 variables.

8. An independent tidy data set with the average of each variable for each activity and each subject is created and saved into **tidy_mean_data.txt** file. The result is a 180 x 68 data frame, where the first column contains subject IDs, the second column contains activity names, and the averages for each of the 66 attributes are in columns 3...68


