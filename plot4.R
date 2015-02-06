#load in the dataset from wd
data=read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=0,sep=";")

#create a date variable called 'FullDate' by pasting the Date and Time variables
data$FullDate=strptime(paste(as.character(data[,1]),as.character(data[,2])),format="%d/%m/%Y %H:%M:%S")

#subset the dataset according to the instructions
data=subset(data,as.Date(data$FullDate) >= as.Date("2007-02-01 00:00:00") & as.Date(data$FullDate) < as.Date("2007-02-03 00:00:00"))

#create the plot
png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

Sys.setlocale("LC_TIME","English")

#plot topleft
plot(data$FullDate,data$Global_active_power,xlab="",ylab="Global Active Power",type="l")

#plot top right
plot(data$FullDate,data$Voltage,xlab="datetime",ylab="Voltage",type="l")

#plot bottom left
plot(data$FullDate,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
lines(data$FullDate,data$Sub_metering_2,col="red")
lines(data$FullDate,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#plot bottom right
plot(data$FullDate,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")


dev.off()