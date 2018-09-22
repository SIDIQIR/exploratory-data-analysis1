install.packages("lubridate")
install.packages("ggplot2")
library(lubridate)
library(ggplot2)

# setting directory
setwd("C:/Coursera/DATA_SCIENCE/Exploratory_data_analysis/exdata%2Fdata%2Fhousehold_power_consumption")
getwd()
# reading the data table
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# filtering data and combing the two dates observations

date1 = data[c(data$Date =="1/2/2007"),]
date2 = data[c(data$Date =="2/2/2007"),]
subt = rbind(date1, date2)


# combinig date and time columns
subt$Date <- as.Date(subt$Date,"%d/%m/%Y")
subt<-cbind(subt, "DateandTime" = as.POSIXct(paste(subt$Date, subt$Time)))

# ploting the graph
plot(subt$Global_active_power ~ subt$DateandTime, type="l", xlab= "By Date and Time", ylab="Global Active power (kilowatts)")

dev.copy(png,'Plot2.png', width=480, height=480)
dev.off()