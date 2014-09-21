Clean_data
==========

This is an instruction of run_analysis.R script.

The script does the following in steps.

1. reads from train folder and generates training dataset.
2. reads from test folder and generates test dataset.
3. generates a total dataset named 'data',attaching test dataset below training dataset
4. reads "features.txt", as part of the colnames of 'data'
5. uses regular expressions to select columns in 'data' whose names contain the pattern "-mean()-" or "-std()-". Selected columns are stored in 'data1'
6. split the data by subject and activity, stored in newdata
7. appy colMeans() to every list in newdata, transform the result into data.frame, (the transposed data) stored in "newdata1"
8. use tapply to take twice the average, first by subject then by activity, stored in newdata
9. output newdata as "prj.txt"
