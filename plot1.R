setwd("C:/Users/sudarshan/coursera/Exploratory data analysis/week1")
data<-read.table("C:/Users/sudarshan/coursera/Exploratory data analysis/data/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
head(data1)
hist(as.numeric(data1$Global_active_power), col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
