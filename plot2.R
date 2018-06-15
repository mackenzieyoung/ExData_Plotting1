dat <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")

sub <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")
sub$DateTime <- paste(sub$Date, sub$Time)
sub$DateTime <- as.POSIXct(sub$DateTime, format= "%d/%m/%Y %H:%M:%OS")

png('plot2.png',width = 480, height = 480)
plot(sub$DateTime, sub$Global_active_power,type = 'l', ylab = 'Global Active Power (kilowatts)', xlab='')
dev.off()
