setwd("C:/Users/sudarshan/coursera/Exploratory data analysis/week1")
data<-read.table("C:/Users/sudarshan/coursera/Exploratory data analysis/data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
head(data1)
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
subMetering1<-data1[,"Sub_metering_1"]
subMetering2<-data1[,"Sub_metering_2"]
subMetering3<-data1[,"Sub_metering_3"]
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data1$Global_active_power~data1$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(data1$Voltage~data1$Datetime, type="l", xlab="datetime", ylab="Voltage")
plot(subMetering1 ~ data1$Datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
lines(subMetering2 ~ data1$Datetime,type="l",col="red")
lines(subMetering3 ~ data1$Datetime,type="l",col="blue")
plot(data1$Global_reactive_power~data1$Datetime,type="l",ylab="Global_reactive-power",xlab="datetime")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
