library("data.table")
setwd("C:/Users/Admin/Desktop/COURSERAJHU/4_exploratory_data_analysis")
powerdata <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
powerdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerdata <- powerdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# plot4-1  topleft
plot(powerdata[, dateTime],powerdata[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
# plot4-2  topright
plot(powerdata[, dateTime],powerdata[, Voltage], type="l", xlab="datetime", ylab="Voltage")
# Plot4-3  buttomleft
plot(powerdata[, dateTime], powerdata[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerdata[, dateTime], powerdata[, Sub_metering_2], col="red")
lines(powerdata[, dateTime], powerdata[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 
# Plot4-4 buttomright
plot(powerdata[, dateTime], powerdata[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()