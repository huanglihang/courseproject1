## set your sys language
Sys.setlocale("LC_ALL", "English")

## please set your own working directory 
setwd("../")
if(!file.exists('course project1')){
  dir.create('course project1')
}

## Reading data
unzip("exdata-data-household_power_consumption.zip")
data = read.table('household_power_consumption.txt',header = T,sep=';',na.string = "?",stringsAsFactor = F)
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]
data$Datetime <- strptime(paste(data$Date,data$Time),
                          format="%Y-%m-%d %H:%M:%S")

## plotting plot3 &save as plot3.png
png('plot3.png')
plot(data$Datetime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
