# Plot 3

# Note: data was fetched and manipulated in plot1.R

# Plot the first line using plot()
with(mydf3,plot(datetime,Sub_metering_1,type="l",col="black",ylim=c(0,40),ylab="Energy sub metering",xlab=""))

# Plot subsequent lines using lines()
lines(mydf3$datetime,mydf3$Sub_metering_2,col="blue",type="l",lwd="1")
lines(mydf3$datetime,mydf3$Sub_metering_3,col="red",type="l",lwd="1")

# Add a legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=c(1,1,1))

# Write out to a file
dev.copy(png,"ExDataCP1Plot3.png")
dev.off()