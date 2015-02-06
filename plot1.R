#load in the dataset from wd
data=read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=0,sep=";")

#create a date variable called 'FullDate' by pasting the Date and Time variables
data$FullDate=strptime(paste(as.character(data[,1]),as.character(data[,2])),format="%d/%m/%Y %H:%M:%S")

#subset the dataset according to the instructions
data=subset(data,as.Date(data$FullDate) >= as.Date("2007-02-01 00:00:00") & as.Date(data$FullDate) < as.Date("2007-02-03 00:00:00"))

#create the plot
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
