# Plot 4

# Fetch the data and subset just the part that we want to plot
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "./power.zip"
#download.file(fileURL, destfile=zipfile, method="curl")
#unzip(zipfile)
datafile <- "household_power_consumption.txt"
mydf <- read.csv(datafile, 
                 header=TRUE, 
                 sep=";", 
                 stringsAsFactors=FALSE, 
                 nrows=100000,
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), 
                 na.strings=c("?"))

# Set par to display two by two plots
par(mfrow=c(2,2))

# Open device
# I could not get this approach to work for plot 4- only the last plot shows up
# in the file. Using dev.copy() below instead
#png(filename="ExDataCP1Plot4.png", width=480, height=480, units="px")

# Plot 1
with(subdf,plot(datetime,Global_active_power,xlab="",ylab="Global Active Power",type="l"))

# Plot 2
with(subdf,plot(datetime,Voltage,xlab="datetime",ylab="Voltage",type="l"))

# Plot 3
with(subdf,plot(datetime,Sub_metering_1,type="l",col="black",ylim=c(0,40),ylab="Energy sub metering",xlab=""))
lines(subdf$datetime,subdf$Sub_metering_2,col="red",type="l",lwd="1")
lines(subdf$datetime,subdf$Sub_metering_3,col="blue",type="l",lwd="1")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=c(0.5,0.5,0.5), bty="n")

# Plot 4
with(subdf,plot(datetime,Global_reactive_power,type="l"))

# Done plotting, close device
dev.copy(png,"ExDataCP1Plot4.png")
dev.off()