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

# setting the parameter
par(mfrow = c(1,1))

# ploting the graph
hist(as.numeric(subt$Global_active_power), col = "green", main = "Global Active Power1", xlab = " Global Active Power (kilowatts)")
dev.copy(png,'Plot1.png', height = 480, width = 480)
dev.off()

     