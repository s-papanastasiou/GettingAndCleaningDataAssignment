The data used here are derived from the Samsung Galaxy S smartphone accelerometer
reading found in the URL below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Two files in the above dataset have been transformed, namely:

- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/train/X_train.txt

For both files, leading and trailing spaces have been removed per line and double (or more) spaces
within the same line have been concatenated to a single space. To repeat this transformation, you can
issue the following in Mac or Linux:
awk '{$1=$1;print}' X_test.txt > X_test-nospace.txt

This action is necessary so that the csv import in R (as performed by the run_analysis.R script)
can correctly import the data as columns must be separated by a single space. The rest of the dataset
is identical to the source.

The meaning of the variables in the dataset are included in the URL link above and are not repeated here.

The summaryData.csv dataset which results from running the script contains the following fields, each of which is explained in the original Samsung dataset with the exception of activityLabel and subject.

- Subject is a number identifying each user as in test/subject_test.txt and train/subject_train.txt in the original dataset

- activityLabel is a description of the activity as in activity_labels.txt in the original dataset

For completeness, the end dataset variables are:

[1] "activityLabel"               "subject"                    
[3] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
[5] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
[7] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
[9] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[15] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[23] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[27] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[35] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[39] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[47] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[59] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[63] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
