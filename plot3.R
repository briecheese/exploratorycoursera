# read in our table
power_consumption<-read.table("~/Downloads/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_consumption<-na.omit(power_consumption)
# make sure that the Date row is formatted as a date & Time row as time
power_consumption$Time<-strptime(paste(power_consumption$Date,power_consumption$Time),"%d/%m/%Y %H:%M:%S")
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption<-subset(power_consumption,Date=="2007-02-02"|Date=="2007-02-01")


##########
# Plot 3 #
##########

png("plot3.png",width=480,height=480,units="px")
plot(power_consumption$Time,power_consumption$Sub_metering_1,type="s",ylab="Energy sub metering",xlab="")
lines(power_consumption$Time,power_consumption$Sub_metering_2,type="s",col="red")
lines(power_consumption$Time,power_consumption$Sub_metering_3,type="s",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()