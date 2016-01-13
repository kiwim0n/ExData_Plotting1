# Plot 3

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

# Open device
png(filename="ExDataCP1Plot3.png", width=480, height=480, units="px")

# Plot the first line using plot()
with(subdf,plot(datetime,Sub_metering_1,type="l",col="black",ylim=c(0,40),ylab="Energy sub metering",xlab=""))

# Plot subsequent lines using lines()
lines(subdf$datetime,subdf$Sub_metering_2,col="red",type="l",lwd="1")
lines(subdf$datetime,subdf$Sub_metering_3,col="blue",type="l",lwd="1")

# Add a legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=c(1,1,1))

# Done plotting, close device
dev.off()