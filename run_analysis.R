activity <- read.table("~/Data/activity_labels.txt" , col.names = c("code", "activity"))

features <- read.table("~/Data/features.txt", col.names = c("n","functions"))
View(features)

subject_test <- read.table("~/Data/test/subject_test.txt", col.names = "subject")
View(subject_test)

x_test <- read.table("~/Data/test/X_test.txt", col.names = features$functions)
View(x_test)

y_test <- read.table("~/Data/test/y_test.txt", col.names = "code")
View(y_test)

subject_train <- read.table("~/Data/train/subject_train.txt", col.names = "subject")
View(subject_train)

x_train <- read.table("~/Data/train/X_train.txt", col.names = features$functions)
View(x_train)
y_train <- read.table("~/Data/train/y_train.txt", col.names = "code")
View(y_train)




X_merge <- rbind(x_train, x_test)
View(X_merge)
Y_merge <- rbind(y_train, y_test)
View(Y_merge)

Subject_Merge <- rbind(subject_train, subject_test)
View(Subject_Merge)
Total_merge <- cbind(Subject_Merge, Y_merge, X_merge)
View(Total_merge)




library(dplyr)
MeasureMSD <- Total_merge %>% select(subject, code, contains("mean"), contains("std"))
View(MeasureMSD)




MeasureMSD$code <- activity[MeasureMSD$code, 2]
View(MeasureMSD)




names(MeasureMSD)[2] = "activity"
names(MeasureMSD)<-gsub("Acc", "Accelerometer", names(MeasureMSD))
names(MeasureMSD)<-gsub("Gyro", "Gyroscope", names(MeasureMSD))
names(MeasureMSD)<-gsub("BodyBody", "Body_L", names(MeasureMSD))
names(MeasureMSD)<-gsub("Mag", "Magnitude_3D", names(MeasureMSD))
names(MeasureMSD)<-gsub("^t", "Time", names(MeasureMSD))
names(MeasureMSD)<-gsub("^f", "Frequency", names(MeasureMSD))
names(MeasureMSD)<-gsub("tBody", "TimeBody", names(MeasureMSD))
names(MeasureMSD)<-gsub("-mean()", "Mean", names(MeasureMSD), ignore.case = TRUE)
names(MeasureMSD)<-gsub("-std()", "STD", names(MeasureMSD), ignore.case = TRUE)
names(MeasureMSD)<-gsub("-freq()", "Frequency", names(MeasureMSD), ignore.case = TRUE)
names(MeasureMSD)<-gsub("angle", "Angle", names(MeasureMSD))
names(MeasureMSD)<-gsub("gravity", "Gravity", names(MeasureMSD))






Tidy_data_AVG <- MeasureMSD %>%
    group_by(subject, activity) %>%
    summarise_all(list(mean = mean))
write.table(Tidy_data_AVG, "Tidy_data_AVG.txt", row.name=FALSE)


str(Tidy_data_AVG)

View(Tidy_data_AVG)
