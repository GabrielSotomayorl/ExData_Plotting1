x<-read.csv("household_power_consumption.txt",header = T, sep = ";")
x$Date<-as.Date(x$Date,"%d/%m/%Y")
y<-subset(x,x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01"))
y$Time<- strptime(y$Time,"%H:%M:%S")

y$Time[1:1440] <- format(y$Time[1:1440],"2007-02-01 %H:%M:%S")
y$Time[1441:2880] <- format(y$Time[1441:2880],"2007-02-02 %H:%M:%S")

png(file = "plot4.png")

par(mfrow=c(2,2),mar=c(4,4,4,4))
plot(y$Time,as.numeric(as.character(y$Global_active_power)),type="l",
     ylab = "Global Active Power (kilowatts)",xlab = "")
plot(y$Time,as.numeric(as.character(y$Voltage)),type="l",
     ylab = "Voltage",xlab = "datetime")
plot(y$Time,as.numeric(as.character(y$Sub_metering_1)),type="l",
     ylab = "Energy sub metering",xlab = "")
points(y$Time,as.numeric(as.character(y$Sub_metering_2)),type="l"
       ,col="red")
points(y$Time,as.numeric(as.character(y$Sub_metering_3)),type="l"
       ,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(y$Time,as.numeric(as.character(y$Global_reactive_power)),type="l",
     ylab = "Global_reactive_power",xlab = "datetime")

dev.off()