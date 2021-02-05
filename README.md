1) Data is downlouded from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

2) The necessary training and the test sets are read from unziped fails:


UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/y_train.txt
UCI HAR Dataset/train/subject_train.txt

UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/test/subject_test.txt

3) The training and the test sets are merged to create one data set

4) Features (measurements) info are loaded

UCI HAR Dataset/features.txt

5) Only the measurements on the mean and standard deviation for each measurement are extracted

6) Activity labels are loaded

UCI HAR Dataset/activity_labels.txt

7) Descriptive activity names are used to name the activities in the data set

8) A second, independent tidy data set with the average of each variable for each activity and each subject are created and written in .txt format