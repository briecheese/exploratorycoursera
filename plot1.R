# read in our table
power_consumption<-read.table("~/Downloads/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_consumption<-na.omit(power_consumption)
# make sure that the Date row is formatted as a date & Time row as time
power_consumption$Time<-strptime(paste(power_consumption$Date,power_consumption$Time),"%d/%m/%Y %H:%M:%S")
power_consumption$Date<-as.Date(power_consumption$Date,"%d/%m/%Y")
power_consumption<-subset(power_consumption,Date=="2007-02-02"|Date=="2007-02-01")


##########
# Plot 1 #
##########

png("plot1.png",width=480,height=480,units="px")
hist(power_consumption$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",freq=TRUE)
dev.off()