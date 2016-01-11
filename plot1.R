setwd("/Users/nuthouse/Documents/ExData_Plotting1")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./power.zip"
download.file(fileURL, destfile=zipfile, method="curl")
unzip(zipfile)
datafile <- "household_power_consumption.txt"

mydf <- read.csv(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, nrows=100000)
mydf <- read.csv(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, nrows=100000,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings=c("?"))


library(lubridate)
library(dplyr)
mydf2 <- mutate(mydf, datetime=parse_date_time(paste(mydf$Date,mydf$Time),orders="dmy hms"))

date1 <- as.POSIXct(strptime(c("2007-02-01 00:00:00"), "%Y-%m-%d %H:%M:%S"))
date2 <- as.POSIXct(strptime(c("2007-02-03 00:00:00"), "%Y-%m-%d %H:%M:%S"))
mydf3 <- subset(mydf2, datetime > date1 & datetime < date2)

hist(mydf3$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",breaks=10,main="Global Active Power")

dev.copy(png,"ExDataCP1Plot1.png")
dev.off()
