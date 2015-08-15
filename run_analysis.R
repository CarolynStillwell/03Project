library("plyr")
library("dplyr")
library("reshape2")

testdat<-read.table("./data/test/X_test.txt") 
trgdat<-read.table("./data/train/X_train.txt")
testlab<-read.table("./data/test/y_test.txt")
trglab<-read.table("./data/train/y_train.txt")
testsubj<-read.table("./data/test/subject_test.txt") 
trgsubj<-read.table("./data/train/subject_train.txt") 
activitydata<-read.table("./data/activity_labels.txt")
variablenames<-read.table("./data/features.txt")

testsubj<-rename(testsubj, subjectcode=V1)  ##renames first column to subjectcode
trgsubj<-rename(trgsubj, subjectcode=V1)  ##renames first column to subjectcode
testlab<-rename(testlab, activitycode=V1)  ##renames first column to activitycode
trglab<-rename(trglab, activitycode=V1)  ##renames first column to activitycode
activitydata<-rename(activitydata, activitycode=V1, activityname=V2)  ##renames columns

## PART ONE combines test and training data sets
alltest<-cbind(testsubj, testlab, testdat) ## combines test subject, activity, data
alltrg<-cbind(trgsubj, trglab, trgdat) ## combines training subject, activity, data
alldata<-rbind(alltest, alltrg) 

##PART TWO Extracts only the measurements on the mean and standard deviation for each measurement
alldatasubset<-select(alldata,subjectcode, activitycode, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, V201:V202, 
                      V214:V215, V227:V228, V240:V241, V253:V254, V266:V271, V345:V350, 
                      V424:V429, V503:V504, V516:V517, V529:V530, V542:V543) 

##PART THREE Uses descriptive activity names to name the activities in the data set
subsetactivitynames<-merge(x=activitydata,y=alldatasubset, by.x="activitycode", by.y="activitycode", all=TRUE) 
subsetactivitynamesclean<-select(subsetactivitynames, -(activitycode)) ##removes activitycode column

##PART FOUR Appropriately labels the data set with descriptive variable names.
namesvector<-variablenames$V2
subsetnamesvector<-namesvector[c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 
                                 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 
                                 424:429, 503:504, 516:517, 529:530, 542:543)] ## selects for only mean and sd columns
cleancolnamesmean<-gsub("-mean()-", "Mean", subsetnamesvector, fixed=TRUE) ## remove punctuation
cleancolnamessd<-gsub("-std()-", "Std", cleancolnamesmean, fixed=TRUE) ## remove punctuation
cleancol2<-gsub("-mean()", "Mean", cleancolnamessd, fixed=TRUE) ## remove punctuation
cleancol3<-gsub("-std()", "Std", cleancol2, fixed=TRUE) ## remove punctuation
newcolnames<-c("activityname", "subjectcode", cleancol3) ##adds first two col names to vector
colnames(subsetactivitynamesclean)<- newcolnames ## renames columns

##PART FIVE creates a second, independent tidy data set
##  with the average of each variable for each activity and each subject.
datamelted<-melt(subsetactivitynamesclean, id=c("activityname", "subjectcode")) ## put all measurements in one column
datagrouped<-group_by(datamelted, activityname, subjectcode, variable) ## group into sections
finaltable<-summarize(datagrouped, averagevalue=mean(value))  ## calculate means




