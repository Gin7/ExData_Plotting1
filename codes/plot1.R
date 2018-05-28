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

#save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(file = "plot1.png", width=480, height=480)

# making a plot
hist(data_use$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# close the device
dev.off()