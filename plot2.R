household_power_consumption <- read.table(file = "~/Desktop/coursera/household_power_consumption.txt", sep=";", dec = ".",header=T, stringsAsFactors=F)
in_dates <- as.Date(c("1/2/2007","2/2/2007"),format="%d/%m/%Y")

hhp <- household_power_consumption[as.Date(household_power_consumption$Date, format = "%d/%m/%Y") %in% in_dates,]

hhp$Dates <- strptime(paste(hhp$Date,hhp$Time), format = "%d/%m/%Y %H:%M:%S")

png('plot2.png')
plot(hhp$Dates,as.numeric(hhp$Global_active_power), type = 'l', main = 'Global Active Power over time', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

