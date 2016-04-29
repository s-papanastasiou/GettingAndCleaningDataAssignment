The data used here are derived from the Samsung Galaxy S smartphone accelerometer
reading found in the URL below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Two files in the above dataset have been transformed, namely:

UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/train/X_train.txt

For both files, leading and trailing spaces have been removed per line and double (or more) spaces
within the same line have been concatenated to a single space. To repeat this transformation, you can
issue the following in Mac or Linux:
awk '{$1=$1;print}' X_test.txt > X_test-mod.txt

This action is necessary so that the csv import in R (as performed by the run_analysis.R script)
can correctly import the data as columns must be separated by a single space. The rest of the dataset
is identical to the source.

The meaning of the variables in the dataset are included in the URL link above and are not repeated here.
