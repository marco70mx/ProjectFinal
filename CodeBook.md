Dataframes, variables

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
