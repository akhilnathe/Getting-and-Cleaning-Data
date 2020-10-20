The run_analysis.R script performs the data cleaning and tidying process as per the requirements.

1.Download the datase:
        Downloaded the data and unzipped into the folder named UCI HAR Dataset
        
2.Assign each data to variables

        a. features <- features.txt 
                It contains the 561 features names
        
        b. activities <- activity_labels.txt
                It has the six basic activity names and its corresonding code
                
        c. subject_test <- test/subject_test.txt 
                It contains data from 9 test subjects
                
        d. x_test <- test/X_test.txt
                contains recorded features test data

        e. y_test <- test/y_test.txt
                contains test data of activities’code labels
                
        f. subject_train<-test/subject_train.txt
                contains train data of 21/30 volunteer subjects being observed
        
        g. x_train <- test/X_train.txt
                contains recorded features train data
        h. y_train <- test/y_train.txt
                contains train data of activities’code labels

3.Merges the training and the test sets to create one data set

        x is created by merging x_train and x_test using rbind() function

        y is created by merging y_train and y_test using rbind() function

        subject is created by merging subject_train and subject_test using rbind() function

        mergedData is created by merging Subject, Y and X using cbind() function

4.Extracts only the measurements on the mean and standard deviation for each measurement

        tidyData is created by subsetting mergedData, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

5.Uses descriptive activity names to name the activities in the data set

        Entire numbers in code column of the tidyData replaced with corresponding activity taken from second column of the activities variable

6.Appropriately labels the data set with descriptive variable names

        code column in tidyData renamed into activities
        All Acc in column’s name replaced by Accelerometer
        All Gyro in column’s name replaced by Gyroscope
        All BodyBody in column’s name replaced by Body
        All Mag in column’s name replaced by Magnitude
        All start with character f in column’s name replaced by Frequency
        All start with character t in column’s name replaced by Time

7.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

        finalData is created by sumarizing tidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
        Export FinalData into finalData.txt file.