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

png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(dataforplot$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()