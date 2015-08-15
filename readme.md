run\_analysis.R performs the following steps 1. loads necessary
libraries 2. reads tables 3. renames some columns to smooth following
steps 4. combines test and training data sets along with activity and
data information 5. extracts only columns that include mean and standard
deviation measurements 6. uses activity names from activity\_labels.txt
to populate activityname column 7. uses measurement names from
features.txt to label measurements, removing punctuation 8. creates a
second data set with the average of each variable for each activity and
each subject
