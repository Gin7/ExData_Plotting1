# first set working directory
setwd("/Users/jingchen/Desktop/Exploratory Data Analysis")

# then make sure the plots folder exists
if (!file.exists('plots')) {
        dir.create("plots")
}

# loading the data
data_total <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_use <- subset(data_total, Date %in% c("1/2/2007","2/2/2007"))
data_use$Date <- as.Date(data_use$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_use$Date), data_use$Time)
data_use$Datetime <- as.POSIXct(datetime)

#save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(file = "plot3.png", width=480, height=480)

# making a plot
with(data_use, {
        plot(Sub_metering_1~Datetime, type="l", xlab="", 
             ylab="Energy sub metering")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the device
dev.off()