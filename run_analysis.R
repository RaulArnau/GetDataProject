
## 
## Run Analysis
## 
# The script does the following: 
# - Open the datasets 
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each 
#   measurement. 
# - Uses descriptive activity names to name the activities in the data set.
# - Appropriately labels the data set with descriptive activity names. 
# - Creates a second, independent tidy data set with the average of each 
#   variable for each activity and each subject. 


# info files
file.features <- "UCI HAR Dataset/features.txt"
file.activities <- "UCI HAR Dataset/activity_labels.txt"

# train datasets
file.train.X <- "UCI HAR Dataset/train/X_train.txt"
file.train.Y <- "UCI HAR Dataset/train/y_train.txt"
file.train.Subject <- "UCI HAR Dataset/train/subject_train.txt"
# file.train.Body.Acc.X <-  "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"
# file.train.Body.Acc.Y <-  "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"
# file.train.Body.Acc.Z <-  "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"
# file.train.Body.Gyro.X <- "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
# file.train.Body.Gyro.Y <- "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
# file.train.Body.Gyro.Z <- "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
# file.train.Total.Acc.X <- "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
# file.train.Total.Acc.Y <- "UCI HAR Dataset/train/Inertial Signals/total_acc_Y_train.txt"
# file.train.Total.Acc.Z <- "UCI HAR Dataset/train/Inertial Signals/total_acc_Z_train.txt"


# test datasets
file.test.X <- "UCI HAR Dataset/test/X_test.txt"
file.test.Y <- "UCI HAR Dataset/test/y_test.txt"
file.test.Subject <- "UCI HAR Dataset/test/subject_test.txt"
# file.test.Body.Acc.X <- "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"
# file.test.Body.Acc.Y <- "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"
# file.test.Body.Acc.Z <- "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"
# file.test.Body.Gyro.X <- "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"
# file.test.Body.Gyro.Y <- "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"
# file.test.Body.Gyro.Z <- "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"
# file.test.Total.Acc.X <- "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"
# file.test.Total.Acc.Y <- "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"
# file.test.Total.Acc.Z <- "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"


## Load info data
features <- read.table(file.features, header=F, sep="")
activities <- read.table(file.activities, header=F, sep="")

## load train data
train.X <- read.table(file.train.X, header=F, sep="")
train.Y <- read.table(file.train.Y, header=F, sep="")
train.Subject <- read.table(file.train.Subject, header=F, sep="")
# inertial data
# train.Body.Acc.X <- read.table(file.train.Body.Acc.X, header=F, sep="")
# train.Body.Acc.Y <- read.table(file.train.Body.Acc.Y, header=F, sep="")
# train.Body.Acc.Z <- read.table(file.train.Body.Acc.Z, header=F, sep="")
# train.Body.Gyro.X <- read.table(file.train.Body.Gyro.X, header=F, sep="")
# train.Body.Gyro.Y <- read.table(file.train.Body.Gyro.Y, header=F, sep="")
# train.Body.Gyro.Z <- read.table(file.train.Body.Gyro.Z, header=F, sep="")
# train.Total.Acc.X <- read.table(file.train.Total.Acc.X, header=F, sep="")
# train.Total.Acc.Y <- read.table(file.train.Total.Acc.Y, header=F, sep="")
# train.Total.Acc.Z <- read.table(file.train.Total.Acc.Z, header=F, sep="")


## load test data
# 
test.X <- read.table(file.test.X, header=F, sep="")
test.Y <- read.table(file.test.Y, header=F, sep="")
test.Subject <- read.table(file.test.Subject, header=F, sep="")
# inertial data
# test.Body.Acc.X <- read.table(file.test.Body.Acc.X, header=F, sep="")
# test.Body.Acc.Y <- read.table(file.test.Body.Acc.Y, header=F, sep="")
# test.Body.Acc.Z <- read.table(file.test.Body.Acc.Z, header=F, sep="")
# test.Body.Gyro.X <- read.table(file.test.Body.Gyro.X, header=F, sep="")
# test.Body.Gyro.Y <- read.table(file.test.Body.Gyro.Y, header=F, sep="")
# test.Body.Gyro.Z <- read.table(file.test.Body.Gyro.Z, header=F, sep="")
# test.Total.Acc.X <- read.table(file.test.Total.Acc.X, header=F, sep="")
# test.Total.Acc.Y <- read.table(file.test.Total.Acc.Y, header=F, sep="")
# test.Total.Acc.Z <- read.table(file.test.Total.Acc.Z, header=F, sep="")


# 1. Merges the training and the test sets to create one data set
dataset.X <- rbind( train.X, test.X )
dataset.Y <- rbind( train.Y, test.Y )
dataset.Subject <- rbind( train.Subject, test.Subject )
colnames(dataset.Y) <- "Activity"
colnames(dataset.Subject) <- "Subject"

# 2. Extracts the measurements on the mean and standard deviation for each variable
# This implies looking for the mean and std patterns in the features set, 
# extract their indices and use them to reduce the complete dataset
idx <- grep("mean|std", features[,2])
datasetMeanStd.X <- dataset.X[, idx]
featuresMeanStd <- features[idx, 2]

# 3. Uses descriptive activity names to name the activities in the data set
# According to the lecture "Editing Text Variables", names of variables should be
#       - all lower case when possible
#       - descriptive
#       - not duplicated
#       - not have underscores or dots or white spaces
#       - character values should be made into factor variables 
#       - should be descriptive

# (lowercase version)
# featuresDescriptive <- gsub("-", "", sub("\\(\\)", "", tolower(featuresMeanStd)))
# activitiesDescriptive <- gsub("_", "", tolower(activities[,2]))

# ignoring the case ofuscates variable names, so just remove punctuation
featuresDescriptive <- gsub("-", "", sub("\\(\\)", "", featuresMeanStd))
activitiesDescriptive <- factor(gsub("_", "", activities[,2]))

# 4. Appropriately labels the data set with descriptive activity names.
colnames(datasetMeanStd.X) <- featuresDescriptive
ActivityLabels <- factor(dataset.Y$Activity, labels=activitiesDescriptive)


dataset <- cbind(datasetMeanStd.X, dataset.Y, dataset.Subject)


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# This implies sorting the simplified dataset by activity and subject
datasetAvg <- ddply(dataset, .(Activity, Subject), .drop=F, .fun=colMeans)

# finaly label the activities in the dataset
datasetAvg$Activity <- factor(datasetAvg$Activity, labels=activitiesDescriptive)

# 6. Write to file
write.table(datasetAvg, "clean_dataset.txt")


