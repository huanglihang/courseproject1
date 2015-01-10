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

## plotting plot1 & save it as plot1.png
png('plot1.png')
hist(data$Global_active_power,xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',main = 'Global Active Power',col = 'red')
dev.off()
