install.packages("lubridate")
install.packages("ggplot2")
library(lubridate)
library(ggplot2)
setwd("C:/Coursera/DATA_SCIENCE/Exploratory_data_analysis/exdata%2Fdata%2Fhousehold_power_consumption")
getwd()
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


date1 = data[c(data$Date =="1/2/2007"),]
date2 = data[c(data$Date =="2/2/2007"),]
subt = rbind(date1, date2)

subt$Date <- as.Date(subt$Date,"%d/%m/%Y")
subt<-cbind(subt, "DateandTime" = as.POSIXct(paste(subt$Date, subt$Time)))



with(subt, {plot(Sub_metering_1 ~ DateandTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(subt$Sub_metering_2 ~ subt$DateandTime, col = 'Red')
lines(subt$Sub_metering_3 ~ subt$DateandTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
