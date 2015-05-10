household_power_consumption <- read.table(file = "~/Desktop/coursera/household_power_consumption.txt", sep=";", dec = ".",header=T, stringsAsFactors=F)
in_dates <- as.Date(c("1/2/2007","2/2/2007"),format="%d/%m/%Y")

hhp <- household_power_consumption[as.Date(household_power_consumption$Date, format = "%d/%m/%Y") %in% in_dates,]

hhp$Dates <- strptime(paste(hhp$Date,hhp$Time), format = "%d/%m/%Y %H:%M:%S")

png('plot4.png')
par(mfrow = c(2,2))
x=hhp$Dates
y1 = as.numeric(hhp$Global_active_power)
y1_lab = 'Global Active Power'
plot(x,y1,type = 'l', ylab = y1_lab)

y2 = as.numeric(hhp$Voltage)
y2_lab = 'Voltage'
plot(x,y2,type = 'l',ylab = y2_lab)


y3a = as.numeric(hhp$Sub_metering_1)
y3b = as.numeric(hhp$Sub_metering_2)
y3c = as.numeric(hhp$Sub_metering_3)
y_lim = range(c(y3a,y3b,y3c))

# first plot
plot(x, y3a, ylim=y_lim, type = 'l',xlab = "", ylab = "")

# second plot  EDIT: needs to have same ylim
par(new = TRUE)
plot(x, y3b, ylim=y_lim, axes = FALSE, xlab = "", ylab = "",type = 'l', col = 'red')

par(new = TRUE)
plot(x, y3c, ylim=y_lim, axes = FALSE, xlab = "Time", ylab = "Energy sub metering", type = 'l', col = 'blue')
legend("topright", lwd = 2, lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

y4 = as.numeric(hhp$Global_reactive_power)
y4_lab = 'Global Reactive Power'
plot(x,y4,type = 'l',ylab = y4_lab)
dev.off()


