### PLOT 2 ###

## Getting the entire dataset : Electric power consumption
data_entire <- read.csv("/Users/salimahmokhtar/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

data_entire$Date <- as.Date(data_entire$Date, format="%d/%m/%Y")

## Subsetting the data from the dates 2007-02-01 and 2007-02-02
data <- subset(data_entire, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_entire)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving plot 2 to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()