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

png(file = "plot2.png")
with(dataforplot, plot(Time, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
with(dataforplot, lines(Time, Global_active_power))
dev.off()

