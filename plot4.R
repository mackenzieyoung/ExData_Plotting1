dat <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")
sub <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
sub$DateTime <- paste(sub$Date, sub$Time)
sub$DateTime <- as.POSIXct(sub$DateTime, format= "%d/%m/%Y %H:%M:%OS")

png('plot4.png',width = 480, height = 480)
par(mfrow=c(2,2))
plot(sub$DateTime, sub$Global_active_power,type = 'l', ylab = 'Global Active Power (kilowatts)', xlab='')
plot(sub$DateTime, sub$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')
plot(sub$DateTime, sub$Sub_metering_1, col='black',ylab='Energy sub metering', xlab="", type ='l')
lines(sub$DateTime, sub$Sub_metering_2, col='red')
lines(sub$DateTime, sub$Sub_metering_3, col='blue')
legend('topright',legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black','red','blue'),lty=1, cex=0.50)
plot(sub$DateTime, sub$Global_reactive_power, type = 'l', ylab = 'Global_reactive_power',xlab = 'datetime')
dev.off()

