# Plot 2

# Fetch the data and subset just the part that we want to plot
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

# Plot to a file
png(filename="ExDataCP1Plot2.png", width=480, height=480, units="px")
plot(subdf$datetime,subdf$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Done plotting, close device
dev.off()