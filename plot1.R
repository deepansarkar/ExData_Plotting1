# Make the first plot

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
png( "plot1.png", width=480, height=480 )

# Plot the histogram with 12 bins
hist( as.numeric(data[,3]), breaks=12, col="red", main="Global Active Power",
      xlab="Global Active Power (kilowatts)", ylab="Frequency" )

# Close the PNG Graphics Device
dev.off()