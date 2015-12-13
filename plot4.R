hpcdata <- read.delim2("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

subhpc <- subset(hpcdata, Date=="1/2/2007" | Date=="2/2/2007")
subhpc$datetime<-strptime(paste(subhpc$Date,subhpc$Time), "%d/%m/%Y %H:%M:%S")

subhpc$Global_active_power<-as.numeric(as.character(subhpc$Global_active_power))
subhpc$Global_reactive_power<-as.numeric(as.character(subhpc$Global_reactive_power))
subhpc$Sub_metering_1<-as.numeric(as.character(subhpc$Sub_metering_1))
subhpc$Sub_metering_2<-as.numeric(as.character(subhpc$Sub_metering_2))
subhpc$Sub_metering_3<-as.numeric(as.character(subhpc$Sub_metering_3))
subhpc$Voltage<-as.numeric(as.character(subhpc$Voltage))

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#Graph 1
plot(subhpc$datetime,subhpc$Global_active_power,type="n", xlab="", ylab="Global Active Power")
lines(subhpc$datetime,subhpc$Global_active_power,lwd="1")
#Graph 2
plot(subhpc$datetime,subhpc$Voltage,type="n", ylab="Voltage", xlab="datetime")
lines(subhpc$datetime,subhpc$Voltage)


#Graph 3
plot(subhpc$datetime,subhpc$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(subhpc$datetime,subhpc$Sub_metering_1)
lines(subhpc$datetime,subhpc$Sub_metering_2,col="red")
lines(subhpc$datetime,subhpc$Sub_metering_3,col="blue")
legend(x="topright",lwd=c(1,1,1), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#Graph 4
plot(subhpc$datetime,subhpc$Global_reactive_power,type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subhpc$datetime,subhpc$Global_reactive_power,lwd="1")

dev.off()


