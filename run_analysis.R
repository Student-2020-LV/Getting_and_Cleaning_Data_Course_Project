

# Downloud Data 

if (!file.exists("Data")) {dir.create("Data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "./Data/finalproject.zip", method = "curl")

# Unzip Data

unzip(zipfile = "./Data/finalproject.zip", exdir = "./Data/UnzipedData")

# Read the training and the test sets

x_train <- read.table("./Data/UnzipedData/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Data/UnzipedData/UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("./Data/UnzipedData/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./Data/UnzipedData/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Data/UnzipedData/UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("./Data/UnzipedData/UCI HAR Dataset/test/subject_test.txt")


#Merges the training and the test sets to create one data set

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)

#Load futures (measurements) info 

feature <- read.table("./Data/UnzipedData/UCI HAR Dataset/features.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement

index_features <- grep("std\\(\\)|mean\\(\\)", feature[,2])


features_names <- feature[index_features,2] 

x_data <- x_data[,index_features]
names(x_data) <- as.character(features_names)

# Crate one data set

all_data <- cbind(s_data,y_data, x_data)
colnames(all_data)[1:2] <- c("subject", "activity")

# Load activity labels

activity_lab <- read.table("./Data/UnzipedData/UCI HAR Dataset/activity_labels.txt")

#Uses descriptive activity names to name the activities in the data set

all_data$activity <- factor(all_data$activity, levels = activity_lab[,1], labels = activity_lab[,2])

# creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(reshape2)

melted_data <- melt(all_data, id = c("subject", "activity"))
tidy_data <- dcast(melted_data, subject + activity ~ variable, mean)

write.table(tidy_data, "./Data/tidy_dataset.txt", row.names = FALSE, quote = FALSE)