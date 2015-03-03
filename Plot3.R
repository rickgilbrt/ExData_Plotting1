#################################
##                              #
## Exploratory Data Analysis    #
##                              #
## Course Project 1, Plot 3     #
##  multi-varable run chart     #
##                              #
## Rick Gilbert  March 2015     #
##                              #
#################################

## The following function was cribbed from R-Help on string capitalization
capwords <- function(s, strict = FALSE) {
        cap <- function(s) paste(toupper(substring(s, 1, 1)),
{s <- substring(s, 2); if(strict) tolower(s) else s},
sep = "", collapse = " " )
sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}

# Download and/or extract
if(!file.exists("household_power_consumption.txt")) {
        if(!file.exists("exdata-data-household_power_consumption.zip")) {
                download.file(
                        url = "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                        destfile = "exdata-data-household_power_consumption.zip", mode="wb")
        }
        unzip("exdata-data-household_power_consumption.zip")
}

## Read in the whole data set
## pwrData <- read.csv2("household_power_consumption.txt")
pwrData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## data.frame sees the date field as a factor due to dd/mm/yyyy formatting, so coerce
## the Date field into a date format

pwrData$Date <- as.Date(pwrData$Date,"%d/%m/%Y")

## Now subset the dataframe to retain only the date range 2/1/2007 through 2/2/2007.
pwrData2 <- subset(pwrData,pwrData$Date == "2007-02-01"|pwrData$Date == "2007-02-02",1:9)

## Now use the Date and Time fields to create a single sampleTime field  
pwrData2$sampleTime <- strptime(paste(as.character(pwrData2$Date), pwrData2$Time),"%Y-%m-%d %H:%M:%S")

##subset and reorder the data frame, retaining only the columns used in any of the plots
pwrData3 <- pwrData2[,c(10,3:5,7:9)]

## Third Plot - run chart of subMetering 1,2,3
## Check for existing file with the target name and, if it exists, delete it
plotFile <- "plot3R.png"
if(file.exists(plotFile)){file.remove(plotFile)}
## open the png file device
png(filename = plotFile,
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

## now plot the chart
plot(pwrData3$sampleTime,pwrData3$Sub_metering_1,
        type="n",
        xlab = "",
        ylab = "Energy sub metering")
        lines(pwrData3$sampleTime,pwrData3$Sub_metering_1,type="l",col="black")
        lines(pwrData3$sampleTime,pwrData3$Sub_metering_2,type="l",col="red")
        lines(pwrData3$sampleTime,pwrData3$Sub_metering_3,type="l",col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=names(pwrData3)[5:7])
dev.off()

## And we are done.


