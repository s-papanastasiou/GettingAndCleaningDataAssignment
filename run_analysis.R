#Assignment: Getting and Cleaning Data Course Project
library(dplyr) 
#The script assumes that it will be run inside the UCI HAR Dataset directory

#1. Merges the training and the test sets to create one data set.
#Load up the test data as space separated values - look into notes, X_train-nospace is a sanitised
#version of the training data with single space between fields
trainX<-read.csv(file="train/X_train-nospace.txt",header=FALSE, sep=" ")
testX<-read.csv(file="test/X_test-nospace.txt",header=FALSE, sep=" ")

#3. Uses descriptive activity names to name the activities in the data set
#Get activity labels for test and train
activityLabels<-read.csv(file="activity_labels.txt", header=FALSE, sep=" ")
labelsTest<-read.csv(file="test/y_test.txt", header=FALSE, sep=" ")
#Just keep the descriptive labels
labelsTestHumanReadable <- left_join(labelsTest, activityLabels)[2]
labelsTrain<-read.csv(file="train/y_train.txt", header=FALSE, sep = " ")
labelsTrainHumanReadable <- left_join(labelsTrain, activityLabels)[2]
#Add the labels to the data
testXWithActivityLabel <-cbind(testX, labelsTestHumanReadable)
trainXWithActivityLabel <- cbind(trainX, labelsTrainHumanReadable)
#3b. Add also the subject number for the test and train data
subjectTest <- read.table(file="test/subject_test.txt")
subjectTrain <-read.table(file="train/subject_train.txt")
testXWithActivityLabel <-cbind(testXWithActivityLabel, subjectTest)
trainXWithActivityLabel <- cbind(trainXWithActivityLabel, subjectTrain)

#4. Appropriately labels the data set with descriptive variable names.
#Get the variable name labels from the test file
variableNames <- read.csv(file="features.txt", header=FALSE, sep=" ")
variableNames <- as.vector(variableNames$V2) #Only get the names, not the id number
variableNames <- c(variableNames, "activityLabel", "subject") #Also add activity and subject label

#Update all variable names
names(testXWithActivityLabel) <- variableNames
names(trainXWithActivityLabel) <- variableNames

#Now we have the data in two frames (testXWithActivityLabel and trainXWithActivityLabel) with clear variable names
#We can combine them into one frame to have everything in one place
allEntries <- rbind(testXWithActivityLabel,trainXWithActivityLabel)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Mean and standard deviation means columns that have -mean() and -std() in their name
relevantColumns = grep("-std\\(\\)|-mean\\(\\)",names(allEntries))
#also include the last two columns which are the activityLabel and Subject
relevantColumns = c(relevantColumns, ncol(allEntries)-1, ncol(allEntries))
#All relevant entries are now in the relevantEntries frame
relevantEntries<-allEntries[relevantColumns]

#---The relevantEntries frame contains everything required up until (and including) step 4
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summaryData <- summarise_each(group_by(relevantEntries,activityLabel, subject), funs(mean))
#Now per activity label and per subject the means of the relevant entries are shown.
#For e.g.
#activityLabel subject tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
#(fctr)   (int)             (dbl)             (dbl)             (dbl)
#1         LAYING       1         0.2215982       -0.04051395        -0.1132036
#And so on.
#Can also output to disk by uncommenting the following
write.table(summaryData, file = "summaryData.csv", row.names = FALSE)