library(dplyr)

## Load data
setwd("D:/Coursera Data Science/GettingTidyingData/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset")
testset <- read.table("test/X_test.txt")
testlabs <- read.table("test/Y_test.txt")
activities <- read.table("activity_labels.txt")
names(activities) <- c("actvty_id","activity")
trainset <- read.table("train/X_train.txt")
trainlabs <- read.table("train/y_train.txt")
subj_train <- read.table("train/subject_train.txt")
subj_test <- read.table("test/subject_test.txt")
features <- read.table("features.txt")

## Merge tables together horizontally and then vertically
names(testlabs) <- "actvty_id"
names(testset) <- features[,2] #Name cols of values with appropriate features
testset.1 <- cbind(testlabs,testset[,1:6]) #First six columns includes mean and std dev for the three key features
names(subj_test) <- "Subject.id"
actvty <- inner_join(activities,testset.1) #Join on actvty_id
testset.2 <- cbind(subj_test,actvty[,2:8]) #link subject id to info 
## Now do same for training data
names(trainlabs) <- "actvty_id"
names(trainset) <- features[,2] #Name cols of values with appropriate features
trainset.1 <- cbind(trainlabs,trainset[,1:6]) #First six columns includes mean and std dev for the three key features
names(subj_train) <- "Subject.id"
actvty_train <- inner_join(activities,trainset.1) #Join on actvty_id
trainset.2 <- cbind(subj_train,actvty_train[,2:8]) #link subject id to info 
## vertically combine train set then test set together
all.data <- rbind(trainset.2,testset.2)
## clean col names
names(all.data) <- gsub(")","",gsub("(","",names(all.data),fixed = T),fixed = T)
names(all.data) <- gsub("-","_",names(all.data))

## Create summary data
all.data.smry <- all.data %>% group_by(Subject.id,activity) %>% summarize(mn.tBodyAcc_mean_X = mean(tBodyAcc_mean_X),
                                                                          mn.tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
                                                                          mn.tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
                                                                          mn.tBodyAcc_std_X = mean(tBodyAcc_std_X),
                                                                          mn.tBodyAcc_std_Y = mean(tBodyAcc_std_Y),
                                                                          mn.tBodyAcc_std_Z = mean(tBodyAcc_std_Z))

write.table(all.data.smry,"summarized_output.txt",row.names = FALSE)
