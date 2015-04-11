# Project 1 for Exploratory data analysis, plot3.R

# Step 1: read in and pre-process the data
data <- read.csv(file="./Data/household_power_consumption.txt", header=TRUE, sep=";",
                 na.strings="?")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# Step 2 subset to 2007-02-01 to 2007-02-02
data_subset <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")

data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%Y-%m-%d %H:%M:%S")

# Plotting
png(file="plot3.png", height=480, width=480, units="px")
plot (data_subset$DateTime, data_subset$Sub_metering_1, type="l",
      xlab="", ylab="Energy sub metering", col="black")
lines (data_subset$DateTime, data_subset$Sub_metering_2, type="l", col="red")
lines (data_subset$DateTime, data_subset$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1",
        "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2)
dev.off()
