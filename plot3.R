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

png(file = "plot3.png")
with(dataforplot, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(dataforplot, lines(Time, Sub_metering_1, col="black"))
with(dataforplot, lines(Time, Sub_metering_2, col="red"))
with(dataforplot, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 
