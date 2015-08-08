### PLOT 3 ###

library(data.table)

## Getting the entire dataset : Electric power consumption
data_entire <- fread ("/Users/salimahmokhtar/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_entire$Date <- as.Date(data_entire$Date, format="%d/%m/%Y")

## Subsetting the data from the dates 2007-02-01 and 2007-02-02
data <- subset(data_entire, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_entire)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving plot3 to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()