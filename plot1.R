### PLOT 1 ###

## Getting the entire dataset : Electric power consumption
data_entire <- read.csv("/Users/salimahmokhtar/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_entire$Date <- as.Date(data_entire$Date, format="%d/%m/%Y")

## Subsetting the data from the dates 2007-02-01 and 2007-02-02
data <- subset(data_entire, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_entire)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
## Saving plot 1 to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()