# Plot 4

# Note: data was fetched and manipulated in plot1.R

# Set par to display two by two plots
par(mfrow=c(2,2))

# Plot 1
with(mydf3,plot(datetime,Global_active_power,xlab="",ylab="Global Active Power",type="l"))

# Plot 2
with(mydf3,plot(datetime,Voltage,xlab="datetime",ylab="Voltage",type="l"))

# Plot 3
with(mydf3,plot(datetime,Sub_metering_1,type="l",col="black",ylim=c(0,40),ylab="Energy sub metering",xlab=""))
lines(mydf3$datetime,mydf3$Sub_metering_2,col="blue",type="l",lwd="1")
lines(mydf3$datetime,mydf3$Sub_metering_3,col="red",type="l",lwd="1")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=c(1,1,1),bty="n")

# Plot 4
with(mydf3,plot(datetime,Global_reactive_power,type="l"))

# Write out to a file
dev.copy(png,"ExDataCP1Plot4.png")
dev.off()