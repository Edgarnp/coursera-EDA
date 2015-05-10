household_power_consumption <- read.table(file = "~/Desktop/coursera/household_power_consumption.txt", sep=";", dec = ".",header=T, stringsAsFactors=F)
in_dates <- as.Date(c("1/2/2007","2/2/2007"),format="%d/%m/%Y")

hhp <- household_power_consumption[as.Date(household_power_consumption$Date, format = "%d/%m/%Y") %in% in_dates,]

hhp$Dates <- strptime(paste(hhp$Date,hhp$Time), format = "%d/%m/%Y %H:%M:%S")

png('plot3.png')
x=hhp$Dates
y1 = as.numeric(hhp$Sub_metering_1)
y2 = as.numeric(hhp$Sub_metering_2)
y3 = as.numeric(hhp$Sub_metering_3)
y_lim = range(c(y1,y2,y3))

# first plot
plot(x, y1, ylim=y_lim, type = 'l',xlab = "", ylab = "")

# second plot  EDIT: needs to have same ylim
par(new = TRUE)
plot(x, y2, ylim=y_lim, axes = FALSE, xlab = "", ylab = "",type = 'l', col = 'red')

par(new = TRUE)
plot(x, y3, ylim=y_lim, axes = FALSE, xlab = "Time", ylab = "Energy sub metering", type = 'l', col = 'blue')
legend("topright", lwd = 2, lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

