hpcdata <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
subhpc <- subset(hpcdata, Date=="1/2/2007" | Date=="2/2/2007")
subhpc$datetime<-strptime(paste(subhpc$Date,subhpc$Time), "%d/%m/%Y %H:%M:%S")
subhpc$Global_active_power<-as.numeric(as.character(subhpc$Global_active_power))
png(file="plot2.png", width=480, height=480)
plot(subhpc$datetime,subhpc$Global_active_power,type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subhpc$datetime,subhpc$Global_active_power,lwd="1")
dev.off()

