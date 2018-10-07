mydata <- read.csv(file="household_power_consumption.txt", 
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

mydata$Time <-  strptime(paste0(mydata$Date," ",mydata$Time),"%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

dataforplot <- subset(mydata, mydata$Date>=as.Date("2007-02-01","%Y-%m-%d") & mydata$Date<=as.Date("2007-02-02","%Y-%m-%d"))

png(file = "plot1.png")
hist(dataforplot$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
