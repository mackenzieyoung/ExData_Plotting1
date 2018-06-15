dat <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")
sub <- subset(dat, Date=="1/2/2007" | Date=="2/2/2007")

png('plot1.png',width = 480, height = 480)
hist(sub$Global_active_power, xlab = 'Global Active Power (kilowatts)', col = 'red', main = 'Global Active Power', ylim = c(0,1200))
dev.off()
