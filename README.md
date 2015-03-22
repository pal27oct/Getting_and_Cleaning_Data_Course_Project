#**Getting and Cleaning Data Course Project**
###**Instructions**
#####You should create one R script called run_analysis.R that does the following: 
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###**Links**
* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###**Code book**
  1. Variable **Subject**. Subject who performed the activity for each window sample. Its range is from 1 to 30. Sources: subject_test.txt, subject_train.txt
  2. Variable **Activity**. Activity names. Sources: activity_labels.txt, y_test.txt, y_train.txt (last 2 consists of indicies in 1st document).
  3. **Other variables**. Identify measurements. All this columns have exhaustive descriptive names. Sources: features.txt, X_test.txt, X_train.txt (see previous variable description).

###**Script description**
  1. Loads and merges test and train sets.
  2. Loads features to name columns, extracts appropriate measurements.
  3. Loads activities indicies, merges it, gets activity labels, adds it to our tidy set.
  4. Loads subject data, merges it, adds it to our tidy set.
  5. Renames column into descriptive names.
  6. Saves tidy set.
  7. Creates new data set with mean of all variables divided by subject and activity.
  8. Saves new set.
