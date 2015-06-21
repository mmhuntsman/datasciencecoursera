
# set working directory to file's location
setwd("D:\\academic\\datasciencecoursera\\getting-and-cleaning-data\\course_project")


#Load the features.txt file for use with both the test and train datasets
featuresDT <- read.table(".\\UCI HAR Dataset\\features.txt")

# Load the activity_labels.txt file for descriptive activity names
activity_labelsDT <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

# Add column names to the activity_labelsDT dataset
colnames(activity_labelsDT) <- c("ActivityID","ActivityName")



############################################
# Train dataset
############################################
X_trainDT <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header=FALSE)
y_trainDT <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
subject_trainDT <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header=FALSE)


# Add a column header to the y_testDT dataset
colnames(y_trainDT) <- "ActivityID"

# Merge the activity_labelsDT with the y_trainDT
# !!!!!! THIS SORTS THE DATA !!!!!!!!!!!!!!!
# activity_trainDT <- merge(y_trainDT,activity_labelsDT, by="ActivityID")


# Add a column header to the subject_testDT dataset
colnames(subject_trainDT) <- "SubjectID"

# Add the column headers by assigning the values from feature.txt 
# to the X_trainDT dataset
colnames(X_trainDT) <- featuresDT[,2]


# subset the dataset by reducing the number of columns to those 
# that contain "mean(" and "std("
x_train_subsetDT <- X_trainDT[,grepl("mean\\(|std\\(",names(X_trainDT))]

trainDT <- cbind(subject_trainDT, y_trainDT, x_train_subsetDT)


############################################
# Test dataset
############################################
X_testDT <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header=FALSE)
y_testDT <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header=FALSE)
subject_testDT <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header=FALSE)

# Add a column header to the y_testDT dataset
colnames(y_testDT) <- "ActivityID"

# Add a column header to the subject_testDT dataset
colnames(subject_testDT) <- "SubjectID"

# Add the column headers by assigning the values from feature.txt 
# to the X_testDT dataset
colnames(X_testDT) <- featuresDT[,2]


# subset the dataset by reducing the number of columns to those 
# that contain "mean(" and "std("
x_test_subsetDT <- X_testDT[,grepl("mean\\(|std\\(",names(X_testDT))]

testDT <- cbind(subject_testDT, y_testDT, x_test_subsetDT)



# Merge the training and the test sets to create one data set
DT <- rbind(trainDT,testDT)

# Merge the activity_labelsDT with DT for descriptive activity names
# (I've waited until now to merge to the activity lables because the 
#  merge function messes up the sorting of the datasets)
DT <- merge(DT,activity_labelsDT, by="ActivityID")

# Group data
GroupDT <- with(DT,aggregate(x=DT[3:68],list(SubjectID=SubjectID,ActivityName=ActivityName), FUN="mean"))

# Create txt file
write.table(GroupDT,file="course_project_step_5_tidy_data_set.txt",row.names=FALSE)