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

## plotting plot2 &save as plot2.png
png("plot2.png")
plot(data$Datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

