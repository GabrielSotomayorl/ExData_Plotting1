x<-read.csv("household_power_consumption.txt",header = T, sep = ";")
x$Date<-as.Date(x$Date,"%d/%m/%Y")
y<-subset(x,x$Date==as.Date("2007-02-02")|x$Date==as.Date("2007-02-01"))
y$Time<- strptime(y$Time,"%H:%M:%S")

png(file = "plot1.png")

hist(as.numeric(as.character(y$Global_active_power)),col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()