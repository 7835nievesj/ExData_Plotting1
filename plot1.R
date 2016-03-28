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

# plot 1
hist(cleanhousePower.df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# save .png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
