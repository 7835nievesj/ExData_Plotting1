# set working directory
setwd("/Users/jose_nieves/Documents/Class_2016/Data.Scientist.Coursera/
      GitHub.Coursera/Exploratory Data Analysis with R")

# load file into R
housePower.df <- reaad.table("household_power_consumption.txt", 
                             sep = ";", header = TRUE, na.strings = "?")

# convert the Date and Time variables to Date/Time classes
dateTime <- paste(as.Date(housePower.df$Date), housePower.df$Time)
housePower.df$dateTime <- as.POSIXct(dateTime)

# subset data frame between 1/2/2007 & 2/2/2007
cleanhousePower.df <- subset(housePower.df, 
                             housePower.df$dateTime >= "2007-02-01 00:00:00" 
                             & housePower.df$dateTime <= "2007-02-02 23:59:00")

# plot 3
with(cleanhousePower.df, {
        plot(Sub_metering_1~dateTime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~dateTime,col='Red')
        lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save .png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
