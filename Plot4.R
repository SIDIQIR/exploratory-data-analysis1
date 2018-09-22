# installing libraries
install.packages("lubridate")
install.packages("ggplot2")
library(lubridate)
library(ggplot2)
# setting up directory
setwd("C:/Coursera/DATA_SCIENCE/Exploratory_data_analysis/exdata%2Fdata%2Fhousehold_power_consumption")
getwd()

# read data table
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# filtering data and combining the observations by row

date1 = data[c(data$Date =="1/2/2007"),]
date2 = data[c(data$Date =="2/2/2007"),]
subt = rbind(date1, date2)

subt$Date <- as.Date(subt$Date,"%d/%m/%Y")

# combing date and time columns
subt<-cbind(subt, "DateandTime" = as.POSIXct(paste(subt$Date, subt$Time)))

# setting up the parameters and margins
par(mar=c(4,4,2,2))
par(mfrow=c(2,2))

# plotting the four graphs

plot(subt$Global_active_power ~ subt$DateandTime, type="l",col = "dark blue", ylab = "Global Active Power", xlab = "")
plot(subt$Voltage ~ subt$DateandTime, type="l", ylab = "Voltage",col = "dark blue", xlab = "datetime")
with(subt, {plot(Sub_metering_1 ~ DateandTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(subt$Sub_metering_2 ~ subt$DateandTime, col = 'Red')
lines(subt$Sub_metering_3 ~ subt$DateandTime, col = 'Blue')

legend("topright", lty=c(1,1),col=c("black","red","blue"), cex = 0.60, bty = "n", box.col = NULL,legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))

plot(subt$Global_reactive_power ~ subt$DateandTime, type="l",col = "blue", ylab = "Global Reactive Power", xlab = "datetime" )

# saving the plot to plot4. PNG
dev.copy(png,'Plot4.png', width=480, height=480)
dev.off()

