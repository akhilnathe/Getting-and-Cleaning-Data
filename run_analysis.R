library(dplyr)
x <- rbind(x_train,x_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)
mergedData <- cbind(subject,y,x)
tidyData<-select(mergedData,subject,code,contains("mean"),contains("std"))
tidyData$code <- activities[tidyData$code, 2]

names(tidyData)[2] = "activity"
names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
names(tidyData)<-gsub("^t", "Time", names(tidyData))
names(tidyData)<-gsub("^f", "Frequency", names(tidyData))
names(tidyData)<-gsub("tBody", "TimeBody", names(tidyData))
names(tidyData)<-gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "STD", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-freq()", "Frequency", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("angle", "Angle", names(tidyData))
names(tidyData)<-gsub("gravity", "Gravity", names(tidyData))


finalData <- tidyData %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))

write.table(finalData, "finalData.txt", row.name=FALSE)