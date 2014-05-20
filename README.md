GetDataProject Information
==============

This repository contains the final project of the course Getting and Cleaning Data [final project] (https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions).

The analysis is performed by a single R script that loads the train and test data of the experiment, and then merges them into a single dataset. The script simplifies the merged dataset by keeping only the mean and standard value of each phisical measurement, and labels them according to their definitions, given in the file *features.txt* and *features_info.txt* (see the [dataset repository] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for more information about the experiment setup) and read _**CodeBook.md**_ for more information about the analysis.

Finally, the script averages the extracted values by activity and subject, 
keeping a single row for each activity-subject pair. The resulting dataset is 
saved as in a new file (named *clean_dataset.txt*) in the current folder.

Note that in order for this analysis to run properly the original [dataset] (http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip) should be located in the same folder, that is **"./UCI HAR Dataset/"**
