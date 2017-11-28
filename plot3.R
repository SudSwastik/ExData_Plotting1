setwd("C:/Users/sudarshan/coursera/Exploratory data analysis/week1")
data<-read.table("C:/Users/sudarshan/coursera/Exploratory data analysis/data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
head(data1)
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
names(data1)
subMetering1<-data1[,"Sub_metering_1"]
subMetering2<-data1[,"Sub_metering_2"]
subMetering3<-data1[,"Sub_metering_3"]
head(subMetering1)
head(subMetering2)
head(subMetering3)
par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
