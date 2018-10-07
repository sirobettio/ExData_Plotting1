# Author Siro Bettio (siro.bettio@gmail.com)

#### WARNING ####
#
# The data file (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
# must be first downloaded and unzipped as household_power_consumption.txt in the working directory
#
srcdata <- read.csv(file="household_power_consumption.txt", 
                    header=TRUE,
                    sep=";",
                    na.strings=c("NA","NaN", "?",""),
                    colClasses = c("character",
                                   "character",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric"
                    ))

# Colums Date and Time are converted respectively as Date and Timestamp
srcdata$Time <-  strptime(paste0(srcdata$Date," ",srcdata$Time),"%d/%m/%Y %H:%M:%S")
srcdata$Date <- as.Date(srcdata$Date, "%d/%m/%Y")

#Subset only data for this exercise (only records from "2007-02-01" to "2007-02-02")
dataforplot <- subset(srcdata, srcdata$Date>=as.Date("2007-02-01","%Y-%m-%d") & srcdata$Date<=as.Date("2007-02-02","%Y-%m-%d"))

png(file = "plot4.png", width = 480, height = 480, units = "px")

# 2x2 frame
par(mfrow=c(2,2))

# First graph
with(dataforplot, plot(Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
with(dataforplot, lines(Time, Global_active_power))

# Second graph
with(dataforplot, plot(Time, Voltage, xlab="datetime", ylab="Voltage", type="n"))
with(dataforplot, lines(Time, Voltage))

# Third graph
with(dataforplot, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(dataforplot, lines(Time, Sub_metering_1, col="black"))
with(dataforplot, lines(Time, Sub_metering_2, col="red"))
with(dataforplot, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth graph
with(dataforplot, plot(Time, Global_reactive_power, xlab="datetime", type="n"))
with(dataforplot, lines(Time, Global_reactive_power))

dev.off() 
