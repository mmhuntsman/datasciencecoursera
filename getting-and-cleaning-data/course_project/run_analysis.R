
# set working directory to file's location
#setwd("D:\\academic\\datasciencecoursera\\getting-and-cleaning-data\\course_project")


#Load the features.txt file for use with both the test and train datasets
featuresDF <- read.table(".\\UCI HAR Dataset\\features.txt")

# Load the activity_labels.txt file for descriptive activity names
activity_labelsDF <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

# Add column names to the activity_labelsDF dataset
colnames(activity_labelsDF) <- c("ActivityID","ActivityName")



############################################
# Train dataset
############################################
X_trainDF <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header=FALSE)
y_trainDF <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
subject_trainDF <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header=FALSE)


# Add a column header to the y_testDF dataset
colnames(y_trainDF) <- "ActivityID"

# Merge the activity_labelsDF with the y_trainDF
# !!!!!! THIS SORTS THE DATA !!!!!!!!!!!!!!!
# activity_trainDF <- merge(y_trainDF,activity_labelsDF, by="ActivityID")


# Add a column header to the subject_testDF dataset
colnames(subject_trainDF) <- "SubjectID"

# Add the column headers by assigning the values from feature.txt 
# to the X_trainDF dataset
colnames(X_trainDF) <- featuresDF[,2]


# subset the dataset by reducing the number of columns to those 
# that contain "mean(" and "std("
x_train_subsetDF <- X_trainDF[,grepl("mean\\(|std\\(",names(X_trainDF))]

trainDF <- cbind(subject_trainDF, y_trainDF, x_train_subsetDF)


############################################
# Test dataset
############################################
X_testDF <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header=FALSE)
y_testDF <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header=FALSE)
subject_testDF <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header=FALSE)

# Add a column header to the y_testDF dataset
colnames(y_testDF) <- "ActivityID"

# Add a column header to the subject_testDF dataset
colnames(subject_testDF) <- "SubjectID"

# Add the column headers by assigning the values from feature.txt 
# to the X_testDF dataset
colnames(X_testDF) <- featuresDF[,2]


# subset the dataset by reducing the number of columns to those 
# that contain "mean(" and "std("
x_test_subsetDF <- X_testDF[,grepl("mean\\(|std\\(",names(X_testDF))]

testDF <- cbind(subject_testDF, y_testDF, x_test_subsetDF)



# Merge the training and the test sets to create one data set
DF <- rbind(trainDF,testDF)

# Merge the activity_labelsDF with DF for descriptive activity names
# (I've waited until now to merge to the activity lables because the 
#  merge function messes up the sorting of the datasets)
DF <- merge(DF,activity_labelsDF, by="ActivityID")

# Group data
GroupDF <- with(DF,aggregate(x=DF[3:68],list(SubjectID=SubjectID,ActivityName=ActivityName), FUN="mean"))

# Create txt file
write.table(GroupDF,file="course_project_step_5_tidy_data_set.txt",row.names=FALSE)