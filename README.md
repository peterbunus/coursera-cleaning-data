Readme - Getting and Cleaning Data Project Usage
========================================================

In order to succesfuly run the scrip, the following steps shall be performed:

* Download the project data from the following location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* Unzip the downloaded data set in the same directory where the **run_analysis.R** file resides. The unzip operation will create a directory called **UCI HAR Dataset** in the current directory.

* In RStudio set the current directory to the directory where the **run_analysis.R** file and the **UCI HAR Dataset** directory reside. The curent directory can be set by using the *setwd(dir)* command where *dir* is a character string describing the current directory.

* Load the **run_analysis.R** file by using the following command *source("run_analysis.R")*. This command will execute the R scrip, read the data set and output the **tiddy_mean_data.tx** file. The script will run for aproximatelly 30-40 sec. 
