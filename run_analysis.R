## Downloading and unziping files
setwd("~/Getting and cleaning data")
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp<-download.file(fileUrl,"temp.zip")
dateDownloaded <- date()
unzip("temp.zip")

## Reading files and naming columns
testset<-read.table("~/Getting and cleaning data/UCI HAR Dataset/test/X_test.txt")
testsubject<-read.table("~/Getting and cleaning data/UCI HAR Dataset/test/subject_test.txt")
testActivity<-read.table("~/Getting and cleaning data/UCI HAR Dataset/test/y_test.txt")
testset<-cbind(testsubject,testActivity,testset) ## Combine all parts of testset

features<-read.table("~/Getting and cleaning data/UCI HAR Dataset/features.txt")
fNames<-as.character(features$V2)
fNames<-c("Subject","Activity_numeric_form",fNames)
colnames(testset)<-fNames ## Naming columns

trainset<-read.table("~/Getting and cleaning data/UCI HAR Dataset/train/X_train.txt")
trainsubject<-read.table("~/Getting and cleaning data/UCI HAR Dataset/train/subject_train.txt")
trainActivity<-read.table("~/Getting and cleaning data/UCI HAR Dataset/train/y_train.txt")
trainset<-cbind(trainsubject,trainActivity,trainset) ## Combine all parts of trainset
colnames(trainset)<-fNames ## Naming columns

## Merging the training and test set to create one data set

dataset<-rbind(trainset,testset)

## Extracts only the measurements on the mean and standard deviation for each measurement.

MeanInd<-grep("mean()",fNames,fixed=TRUE) ## Column numbers of variables which name contains exactly mean() without meanFreq()
StdInd<-grep("std()",fNames, fixed=TRUE) ## Column numbers of variables which name contains exactly std() 
Ind<-sort(c(MeanInd,StdInd)) ## Column numbers of variables which name contains exactly mean() or std()
Measurements<-dataset[ ,Ind]

## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names.
Labels_id<-dataset$Activity_numeric_form
Labels_descriptive_names<-vector(mode="character",length=length(Labels_id))
for (i in 1:length(Labels_id)) {
        if (Labels_id[i]==1) Labels_descriptive_names[i]<-"WALKING"
        if (Labels_id[i]==2) Labels_descriptive_names[i]<-"WALKING_UPSTAIRS"
        if (Labels_id[i]==3) Labels_descriptive_names[i]<-"WALKING_DOWNSTAIRS"
        if (Labels_id[i]==4) Labels_descriptive_names[i]<-"SITTING"
        if (Labels_id[i]==5) Labels_descriptive_names[i]<-"STANDING"
        if (Labels_id[i]==6) Labels_descriptive_names[i]<-"LAYING"       
}

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
subject<-factor(dataset[,1])
Labels_descriptive_names<-factor(Labels_descriptive_names)
newdataset<-cbind(subject,Labels_descriptive_names,Measurements)
s<-split(newdataset,list(subject,Labels_descriptive_names), drop=TRUE) ## split data according to combinations of subject and activity
tempdataset<-sapply(s, function (x) colMeans(x[, 3:68])) ## average of each variable for combination of subject and activity 
independentdataset<-data.frame(t(tempdataset)) ## transpose of data frame 
splitNames<-strsplit(rownames(independentdataset),"\\.") 
subject<-sapply(splitNames, function(x) {x[1]}) ##rownames before .
activity<-sapply(splitNames, function(x) {x[2]}) ##rownames after .
finaldataset<-cbind(subject,activity,independentdataset)
row.names(finaldataset)=NULL ## Turn off row.names because I included that information as two seperate columns
namesofcolumns<-colnames(finaldataset)
tempnames<-gsub("\\.","",namesofcolumns) ## Cleaning all .
tempnames1<-gsub("BodyBody","body",tempnames,fixed=TRUE) ## Replacing string "BodyBody" with string "body" in variables names
colnames(finaldataset)<-tolower(tempnames1) ## Making all names to be lowercase
write.table(finaldataset,"~/Getting and cleaning data/tidydataset.txt",sep="\t", row.names=FALSE) ## Saving tidy dataset

