library("data.table")
setwd("C:/Users/Admin/Desktop/COURSERAJHU/4_exploratory_data_analysis")
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
powerdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png(file="plot1.png", width=480, height=480)
hist(powerdata[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()