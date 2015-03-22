run_analysis <- function() {  
      # load test and train sets, merge it and collect garbage
      test_set <- read.table("test/X_test.txt")
      train_set <- read.table("train/X_train.txt")
      merged_set <- rbind(test_set, train_set)
      rm(test_set)
      rm(train_set)
      
      # load features, extract useful measurements
      features <- read.table("features.txt", stringsAsFactors=FALSE)[, 2]
      useful_indicies <- grep("std\\(\\)|mean\\(\\)", features)
      merged_set <- merged_set[useful_indicies]
      names(merged_set) <- features[useful_indicies]
      
      # load test and train labels, merge it and collect garbage
      test_activities <- read.table("test/y_test.txt")
      train_activities <- read.table("train/y_train.txt")
      merged_activities <- rbind(test_activities, train_activities)
      rm(test_activities)
      rm(merged_activities)
      
      # load activity labels, replace labels in sets with appropriate activity labels, 
      # collect garbage, add activity column to merged set
      activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)[, 2]
      merged_activities_count <- length(merged_activities)
      for (i in 1:merged_activities_count)
            merged_activities[i] <- activity_labels[merged_activities[, 1][i]]
      rm(activity_labels)      
      names(merged_activities) <- "activity"
      merged_set <- cbind(merged_activities, merged_set)
      
      # load test and train subject data, merge it,  collect garbage,
      # add subject column to merged set
      subject_test <- read.table("test/subject_test.txt")
      subject_train <- read.table("train/subject_train.txt")
      merged_subject <- rbind(subject_test, subject_train)
      rm(subject_test)
      rm(subject_train)      
      names(merged_subject) <- "subject"
      merged_set <- cbind(merged_subject, merged_set)
      
      # rename columns of merged set in a more readable way
      names(merged_set) <- gsub("BodyBody", "Body", names(merged_set))
      names(merged_set) <- gsub("^t", "time", names(merged_set))
      names(merged_set) <- gsub("^f", "freq", names(merged_set))
      names(merged_set) <- gsub("std", "Std", names(merged_set))
      names(merged_set) <- gsub("mean", "Mean", names(merged_set))
      names(merged_set) <- gsub("\\(|\\)|-", "", names(merged_set))
      
      # finally save merged data
      write.table(merged_set, "tidy_data.txt", row.name=FALSE)
      
      # sort merged set,get mean of all variables, write mean set
      mean_set <- merged_set[order(c(merged_set$subject, merged_set$mean)), ]
      mean_set <- aggregate(.~subject+activity, mean_set, mean)
      write.table(mean_set, "mean_set.txt", row.name=FALSE)
      mean_set
}
