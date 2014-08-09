# Make the second plot

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
png( "plot2.png", width=480, height=480 )

# Plot the Global Active Power data without the x-axis
plot( as.numeric(data[,3]), type="l", xaxt="n",
      xlab="", ylab="Global Active Power (kilowatts)" )
# Find the location of the point where the date changes
loc <- match( "2/2/2007", data[,1] ) - 1
# Add the x-axis to the plot
axis( side=1, at=c(0,loc,nrow(data)), labels=c("Thu","Fri","Sat") )

# Close the PNG Graphics Device
dev.off()