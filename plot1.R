# Project 1 for Exploratory data analysis, plot1.R

 # Step 1: read in and pre-process the data
 data <- read.csv(file="./Data/household_power_consumption.txt", header=TRUE, sep=";",
                  na.strings="?")
 
 data$Date <- as.Date(data$Date,format="%d/%m/%Y")
 
 # Step 2 subset to 2007-02-01 to 2007-02-02
 data_subset <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
 
 hist(data_subset$Global_active_power, col="red", main="Global Active Power",
      xlab="Global Active Power (kilowatts)",ylab="Frequency")
 
 dev.copy(png, file="plot1.png", height=480, width=480)
 dev.off()
 
 
 