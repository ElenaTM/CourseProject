## run_analysis.R
##

######################################################################## 
## 1. The training and the test sets are merged to one single data set.
######################################################################## 

# Make sure data.table package may be used
if (!require("data.table")) {
  install.packages("data.table")
}
require("data.table")

# Make sure plyr package may be used
if (!require("plyr")) {
  install.packages("plyr")
}
require("plyr")

# Loading Subject number (the subject who performed the activity) and merging
subjecttest  <- read.table('./UCI HAR Dataset/test/subject_test.txt', col.names=c('Subject'))
subjecttrain <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names=c('Subject'))
subjectall   <- rbind(subjecttest,subjecttrain)

# Loading feature and merging
featuretest  <- read.table('./UCI HAR Dataset/test/X_test.txt')
featuretrain <- read.table('./UCI HAR Dataset/train/X_train.txt')
featureall   <- rbind(featuretest,featuretrain)

# The name of the colums in featureall needs to be changed.
# It is done according to the features.txt labels
featurelabel         <- read.table('./UCI HAR Dataset/features.txt', col.names=c('index', 'labels'))
colnames(featureall) <- featurelabel$labels

######################################################################## 
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
######################################################################## 

# Measurements on the mean
featuremean                <- as.character(featurelabel$labels[grepl('mean()', featurelabel$labels)])
featuremeanWithoutFreqmean <- as.character(featuremean[!grepl('meanFreq()', featuremean)])

# Measurements on the std
featurestd <- as.character(featurelabel$labels[grepl('std()', featurelabel$labels)])

# Selecting just the required fields
featuretobeextracted <- c(featuremeanWithoutFreqmean,featurestd)
featureselected      <- featureall[,c(featuretobeextracted)]

######################################################################## 
## 3. Uses descriptive activity names to name the activities in the 
##    data set.
########################################################################

# Loading activities number and merging
activitytest  <- read.table('./UCI HAR Dataset/test/y_test.txt',col.names=c('Activity'))
activitytrain <- read.table('./UCI HAR Dataset/train/y_train.txt',col.names=c('Activity'))
activityall   <- rbind(activitytest,activitytrain)

# Loading activity labels
activitylabel <- read.table('./UCI HAR Dataset/activity_labels.txt',col.names=c('id','descname'))

# descriptive names according to activity_labels.txt
currentActivity = 1
for (currentActivity in 1:dim(activitylabel)[1]) {
  activityall$Activity <- gsub(currentActivity, activitylabel[currentActivity,2], activityall$Activity)
  currentActivity <- currentActivity + 1
}

######################################################################## 
## 4. Appropriately labels the data set with descriptive variable names.
########################################################################

names(featureselected) <- gsub('tBody','Time body ', names(featureselected))
names(featureselected) <- gsub('fBody','Frequency body ', names(featureselected))
names(featureselected) <- gsub('tGravity','Time gravity ', names(featureselected))
names(featureselected) <- gsub('Acc','accelerometer ', names(featureselected))
names(featureselected) <- gsub('Gyro','gyroscope ', names(featureselected))
names(featureselected) <- gsub('-mean','mean ', names(featureselected))
names(featureselected) <- gsub('mag','magnitude ', names(featureselected))
names(featureselected) <- gsub('-std','standard deviation ', names(featureselected))
names(featureselected) <- gsub('\\(|\\)','', names(featureselected), perl=TRUE)

######################################################################## 
## 5. From the data set in step 4, creates a second, independent tidy 
##    data set with the average of each variable for each activity and 
##    each subject..
########################################################################

# Combine all data
tidydataset <- cbind(subjectall,activityall,featureselected)

# Mean of each variable (for each activity and subject)
tidydatasetmean <- ddply(tidydataset, c("Subject","Activity"), numcolwise(mean))

# Output
write.table(tidydatasetmean, row.name=FALSE, file = "Results_CourseProject.txt")
