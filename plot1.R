install.packages("lubridate")
install.packages("ggplot2")
library(lubridate)
library(ggplot2)

setwd("C:\Coursera\DATA_SCIENCE\Exploratory_data_analysis\household_power_consumption")
getwd()
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


date1 = data[c(data$Date =="1/2/2007"),]
date2 = data[c(data$Date =="2/2/2007"),]
subt = rbind(date1, date2)

par(mfrow = c(1,1))

hist(as.numeric(subt$Global_active_power), col = "green", main = "Global Active Power", xlab = " Global Active Power (kilowatts)")
dev.copy(png,'Plot1.png')
dev.off()

     