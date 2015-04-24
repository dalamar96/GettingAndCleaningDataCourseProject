# GettingAndCleaningDataCourseProject
Course Project for the Coursera Online Class - Getting and Cleaning Data

This script creates the tidydata.txt file containing a tidy data set as described in the codebook.md file. 

The tidy dataset contains the average of the means and standard deviations of 30 subjects doing 6 activities each measured by a samsung smart watch.

*First we download the raw data zip file if it isn't already in the working directory
*Then we unzip and load all the files we are interested in (as described in the codebook.md file)
*Once the data frames are created, we merge columns as needed
*We set up the column names to be more descriptive
*Merge the rows from the two main data sets created
*Reduce the data set down to only the variables we are interested in (Mean and Standard Deviations)
*Aggregate the average of all the means and Standard deviations by Subject and Activity
*Clean up the Column headers
*Export the new data frame (Tidy Data) to a text file (tidydata.txt)

*Details on the files and each step of the process can be found in the codebook.md file.*
