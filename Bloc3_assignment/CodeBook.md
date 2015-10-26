# Datascience
# Bloc 3: Getting and Cleaning Data
# Assignment 
# CodeBook

# Tidy data step by step

Merge
==================================================================

-> datatest 

- combine by column : 'X_test', 'subject_test', 'Y_test'

-> datatrain

- combine by column : 'X_train', 'subject_train', 'Y_train'

-> datatesttrain (creation)

- combine by row datatest and datatrain


Mean dataset
==================================================================

-> dataextrac (creation)

- search in the features_info for the variables that contain mean or std in their name. 
- form a new dataset by extracting from datatesttrain the corresponding data. (also include subject and activity variables)

Activity labels
==================================================================

-> dataextrac (modification)

- Use the activity_labels
- For each activity observation in dataextrac, associate the corresponding label


Variable names
==================================================================

-> dataextrac (modification)

- Use the features_info
- Add the subnect_id and activity variable names
- Associate for each variable the corresponding name


Variable names
==================================================================

-> average_data (creation)

- with the dplyr library
- group by subject_id and for each subject, group by activity
- Compute the mean of each group for all the variables


