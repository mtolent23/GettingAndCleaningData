# 1. Merges the training and the test sets to create one data set.
        
# read feature.txt     
features <- read.table("features.txt", col.names=c("MeasureID", "MeasureName"))  
                
# read the test sets
subtest_set <- read.table("test/subject_test.txt", col.names=c("SubjectID"))
xtest_set <- read.table("test/X_test.txt", col.names=features$MeasureName)
ytest_set <- read.table("test/Y_test.txt", col.names=c("ActivityID"))
        
# bind the test sets
test_set <- cbind(subtest_set, ytest_set)
test_set <- cbind(test_set, xtest_set)
                
# read the train sets
subtrain_set <- read.table("train/subject_train.txt", col.names=c("SubjectID"))
xtrain_set <- read.table("train/X_train.txt", col.names=features$MeasureName)
ytrain_set <- read.table("train/Y_train.txt", col.names=c("ActivityID"))
        
# bind the train sets
train_set <- cbind(subtrain_set, ytrain_set)
train_set <- cbind(train_set, xtrain_set)
                
# return merged data sets
merged_data <- rbind(test_set, train_set)
print("Merged the training and the test sets")
        
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        
# get columns measuring mean and standard deviation fromm features.txt
mean_std_cols <- grep(".*mean\\(\\)|.*std\\(\\)", features$MeasureName)
                
# extract measurments from merged data
reduced_data <- merged_data[ ,mean_std_cols]
print("Extracted measurements on the mean and standard deviation only")
                
# 3. Uses descriptive activity names to name the activities in the data set       
activity_labels <- read.table("activity_labels.txt", col.names=c("ActivityID", "ActivityName"))
activity_labels[, 2] = gsub("_", "", tolower(as.character(activity_labels[, 2])))
print("Used descriptive activity names")        
                
# 4. Appropriately labels the data set with descriptive activity names. 
                
merged_reduced_labeled_data <- merge(activity_labels, reduced_data)
print("Labeled the data set with descriptive activity names")
write.table(merged_reduced_labeled_data, "merged_clean_data.txt")
print("Generated merged_clean_data.txt, merged reduced and labeled data set")
                
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
                
# melt dataframe
measure_cols = which(!(names(merged_reduced_labeled_data) %in% c("ActivityID", "ActivityName", "SubjectID")))
melted_data <- melt(merged_reduced_labeled_data, id=c("ActivityName", "SubjectID"), measure.vars=measure_cols)
                
# cast dataframe to apply mean function on each variable
library(reshape2)
tidy_data <- dcast(melted_data, ActivityName + SubjectID ~ variable, mean) 
                
write.table(tidy_data, "tidy.txt")
print("Generated tidy.txt file, data set with the average of each variable for each activity and each subject")
