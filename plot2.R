# Project 1 for Exploratory data analysis, plot2.R

# Step 1: read in and pre-process the data
data <- read.csv(file="./Data/household_power_consumption.txt", header=TRUE, sep=";",
                 na.strings="?")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# Step 2 subset to 2007-02-01 to 2007-02-02
data_subset <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%Y-%m-%d %H:%M:%S")

# Plotting
png(file="plot2.png", height=480, width=480, units="px")
plot (data_subset$DateTime, data_subset$Global_active_power, type="l",
      xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
