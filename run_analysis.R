library(plyr)

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# 1. Merge the training and test sets to create one data set
X_total <- rbind(x_train,x_test)
y_total <- rbind(y_train,y_test)
subject_total <- rbind(subject_train,subject_test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement
selected_var <- grep("-(mean\\(\\)|std\\(\\))",features[,2])
X_total <- X_total[,selected_var]
names(X_total) <- features[selected_var, 2]

# 3. Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
y_total[, 1] <- activities[y_total[, 1], 2]
names(y_total) <- "activity"

# 4. Appropriately label the data set with descriptive variable names
names(subject_total) <- "subject"
total_data <- cbind(X_total, y_total, subject_total)

# 5. Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
averages_data <- ddply(total_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "tidydata.txt", row.name=FALSE)

