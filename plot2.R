# Plot 2

# Note: data was fetched and manipulated in plot1.R

plot(mydf3$datetime,mydf3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Write out to a file
dev.copy(png,"ExDataCP1Plot2.png")
dev.off()