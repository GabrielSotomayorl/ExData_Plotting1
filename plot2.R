x<-read.csv("household_power_consumption.txt",header = T, sep = ";")
x$Date<-as.Date(x$Date,"%d/%m/%Y")
y<-subset(x,x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01"))
y$Time<- strptime(y$Time,"%H:%M:%S")

y$Time[1:1440] <- format(y$Time[1:1440],"2007-02-01 %H:%M:%S")
y$Time[1441:2880] <- format(y$Time[1441:2880],"2007-02-02 %H:%M:%S")

png(file = "plot2.png")

plot(y$Time,as.numeric(as.character(y$Global_active_power)),type="l",
     ylab = "Global Active Power (kilowatts)",xlab = "")

dev.off()