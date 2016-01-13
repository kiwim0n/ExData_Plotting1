# Plot 1

# Needed libraries
library(lubridate)
library(dplyr)

# Fetch the data set
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./power.zip"
download.file(fileURL, destfile=zipfile, method="curl")
unzip(zipfile)
datafile <- "household_power_consumption.txt"
mydf <- read.csv(datafile, 
                 header=TRUE, 
                 sep=";", 
                 stringsAsFactors=FALSE, 
                 nrows=100000,
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                 na.strings=c("?"))

# Subset just the rows we want to plot
subdf <- subset(mydf, Date=="1/2/2007" | Date=="2/2/2007")

# Create a new column with correctly formatted date/time
subdf <- mutate(subdf, datetime=parse_date_time(paste(subdf$Date,subdf$Time),orders="dmy hms"))

# Copy the histogram to a file
# Use png() so we can set the pixel size
png(filename="ExDataCP1Plot1.png", width=480, height=480, units="px")
hist(subdf$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")

# Done plotting, close device
dev.off()
