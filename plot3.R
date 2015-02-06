#load in the dataset from wd
data=read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=0,sep=";")

#create a date variable called 'FullDate' by pasting the Date and Time variables
data$FullDate=strptime(paste(as.character(data[,1]),as.character(data[,2])),format="%d/%m/%Y %H:%M:%S")

#subset the dataset according to the instructions
data=subset(data,as.Date(data$FullDate) >= as.Date("2007-02-01 00:00:00") & as.Date(data$FullDate) < as.Date("2007-02-03 00:00:00"))

#create the plot
png("plot3.png",width=480,height=480)

Sys.setlocale("LC_TIME","English")
plot(data$FullDate,data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
lines(data$FullDate,data$Sub_metering_2,col="red")
lines(data$FullDate,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))


dev.off()