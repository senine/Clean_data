Clean_data
==========

This is an instruction of run_analysis.R script.

The script does the following in steps.

1. reads from train folder and generates training dataset.
2. reads from test folder and generates test dataset.
3. generates a total dataset named 'data',attaching test dataset below training dataset
4. reads "features.txt", as part of the colnames of 'data'
5. uses regular expressions to select columns in 'data' whose names contain the pattern "-mean()-" or "-std()-". Selected columns are stored in 'data1'
6. uses strsplit() to extract the activity in the colnames, stored in 'namelist'
7. transform 'data1' as matrixs, add subject as rownames and activity as colnames
8. use melt() in reshape2 package to regenerate the data form, stored in data3
9. use tapply to take twice the average, first by subject then by activity, stored in newdata
10. output newdata as "prj.txt"
