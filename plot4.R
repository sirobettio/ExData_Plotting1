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

png(file = "plot4.png")
par(mfrow=c(2,2))
with(dataforplot, plot(Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
with(dataforplot, lines(Time, Global_active_power))

with(dataforplot, plot(Time, Voltage, xlab="datetime", ylab="Voltage", type="n"))
with(dataforplot, lines(Time, Voltage))

with(dataforplot, plot(Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(dataforplot, lines(Time, Sub_metering_1, col="black"))
with(dataforplot, lines(Time, Sub_metering_2, col="red"))
with(dataforplot, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(dataforplot, plot(Time, Global_reactive_power, xlab="datetime", type="n"))
with(dataforplot, lines(Time, Global_reactive_power))
dev.off() 
