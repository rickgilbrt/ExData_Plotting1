# Introduction to Rick's solution to Course Project 1

### Description of the solution scripts (not quite pseudocode)

The solution files for this project are 4 very similar R scripts.

The steps are as follows:
* Define a function, **capwords** to apply initial capital letters to phrases.  There may be a direct R function for this, but I found this function defined in R Help, and decided to use it to meet some of the title and axis label requirements.
* Check for the presence of the source file or it's zipped form in the working directory.  If the source data are not available, they are downloaded and unzipped from the source specified in the assignment description.
* Read and parse the source data using read.table, converting any "?" values to NA's.
* Subset the data to the dates of interest.
* Create a datetime field, **sampleTime**, which is needed for the abscissa of some of the plots.  Note that the resulting datetimes are labeled as "PST."  I did not check to see if the original time data were indeed PST, but that would not have changed the plots in this exercise.
* Reorder and subset the columns of the dataset to those required for the plots.
* Check for the presence of a png file having the required file name.  If it exists, try to delete it.  This step will fail if the file is open in another application, and the script will not run properly.
* Open a png device with the file name Plot***n***.png, where ***n*** is the same as the R script Plot file number.
* Generate the plot
* Close the png device

### The four script files are
* Plot1.R
* Plot2.R
* Plot3.R
* Plot4.R

Each script can be run by sourcing it to R, e.g., **source(Plot1.R)**.

### The resulting plots are in the following files:
* Plot1.png
* Plot2.png
* Plot3.png
* Plot4.png

### Notes
* Because I read in the whole file and subset it, this script takes a long time to run.  I did not explore the option of reading in only he two relevant days from the source file.
* As noted above, these scripts will fail if a file with the target name exists *AND* is open in the working directory.
* Also, if a script fails for any reason once a png is opened, there is no code to close the png device.  If the device is not closed manually from the console, subsequent runs of the script will also fail due to the png file being open in R.

## End of Rick's solution notes
Beyond this are the original README notes from Roger Peng's repo

## ===================================================


## Introduction
### The remainder of this file is 

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

