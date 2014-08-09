# Make the fourth plot

# Clear R Workspace
rm( list=ls() )

# Read the data
fileName <- "E:/COURSES/DATA SCIENCE/4 Exploratory Data Analysis/Course Project 1/household_power_consumption.txt"
data <- read.table( fileName, header=TRUE, sep=";" )
data <- as.matrix( data )

# Extract the subset based on the 2 dates
date1 <- "1/2/2007"
date2 <- "2/2/2007"
selection <- data[,1]==date1 | data[,1]==date2
data <- data[selection,]

# Set up the PNG Graphics Device
png( "plot4.png", width=480, height=480 )

# Set up the plot parameters
par( mfcol=c(2,2) )

# Find the location of the point where the date changes
loc <- match( "2/2/2007", data[,1] ) - 1

# Subplot 1 at (1,1)
# Plot the Global Active Power data without the x-axis
plot( as.numeric(data[,3]), type="l", xaxt="n",
      xlab="", ylab="Global Active Power" )
# Add the x-axis to the plot
axis( side=1, at=c(0,loc,nrow(data)), labels=c("Thu","Fri","Sat") )

# Subplot 2 at (2,1)
# Find the y-axis limits
ylim <- as.numeric( c(0,max(data[,7:9],na.rm=TRUE)) )
# Plot the sub_metering_1 data in black
plot( as.numeric(data[,7]), type="l", col="black", xaxt="n",
      xlab="", ylab="Energy sub metering", ylim=ylim )
par( new=TRUE )
# Plot the sub_metering_2 data in red
plot( as.numeric(data[,8]), type="l", col="red", xaxt="n",
      xlab="", ylab="", ylim=ylim )
par( new=TRUE )
# Plot the sub_metering_3 data in blue
plot( as.numeric(data[,9]), type="l", col="blue", xaxt="n",
      xlab="", ylab="", ylim=ylim )
# Find the location of the point where the date changes
loc <- match( "2/2/2007", data[,1] ) - 1
# Add the x-axis to the plot
axis( side=1, at=c(0,loc,nrow(data)), labels=c("Thu","Fri","Sat") )
# Add the legent to the top right of the plot
legend( "topright", col=c("black","red","blue"), lty=1, bty="n",
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

# Subplot 3 at (1,2)
# Plot the Voltage data without the x-axis
plot( as.numeric(data[,5]), type="l", xaxt="n",
      xlab="datetime", ylab="Voltage" )
# Add the x-axis to the plot
axis( side=1, at=c(0,loc,nrow(data)), labels=c("Thu","Fri","Sat") )

# Subplot 4 at (2,2)
# Plot the Global_reactive_power data without the x-axis
plot( as.numeric(data[,4]), type="l", xaxt="n",
      xlab="datetime", ylab="Global_reactive_power" )
# Add the x-axis to the plot
axis( side=1, at=c(0,loc,nrow(data)), labels=c("Thu","Fri","Sat") )

# Close the PNG Graphics Device
dev.off()