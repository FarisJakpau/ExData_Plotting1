### PLOT 3 ###

library(data.table)

## Getting the entire dataset : Electric power consumption
data_entire <- fread ("/Users/salimahmokhtar/household_power_consumption.txt", na.strings="?")

## Subsetting the data from the dates 2007-02-01 and 2007-02-02
data_entire$Date <- as.Date(data_entire$Date, format="%d/%m/%Y")
data <- subset(data_entire, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_entire)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting and save in a file named plot3.png
png(filename="plot3.png", width=480, height=480)
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ Datetime,col='Red')
  lines(Sub_metering_3 ~ Datetime,col='Blue')}
)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()