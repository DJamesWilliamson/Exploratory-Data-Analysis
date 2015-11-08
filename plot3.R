# Data source:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Beware, large dataset
# 2,075,259 rows and 9 columns
# 2075259 * 9 * 8 / 2^20      # ~140 Mb RAM required

# The following descriptions of the 9 variables in the dataset
# are taken from the UCI web site:
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
#         
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy).
#         It corresponds to the kitchen, containing mainly a dishwasher, an oven 
#         and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy).
#         It corresponds to the laundry room, containing a washing-machine, 
#         a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy).
#         It corresponds to an electric water-heater and an air-conditioner.


# Initial read of data to facilitate import of full dataset:
initialRead <- read.table("household_power_consumption.txt", 
                          header=TRUE, sep = ";", 
                          na.strings = "?", 
                          stringsAsFactors = FALSE,
                          comment.char = "",
                          nrows = 100)
classes <- sapply(initialRead, class)
# classes
rm(initialRead)
power <- read.table("household_power_consumption.txt", 
                    header=TRUE, sep = ";", 
                    na.strings = "?", 
                    stringsAsFactors = FALSE,
                    comment.char = "", 
                    colClasses = classes)
# print(object.size(power), units="Mb")
# str(power)
# names(power)
# summary(power)          # Note NAs

library(dplyr)
library(lubridate)
power.dp <- tbl_df(power)
dat <- filter(power.dp, Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(datetime = paste(Date, Time, sep = " ")) %>%
        mutate(Date = dmy(Date), datetime = dmy_hms(datetime))

# Remove unnecessary objects to free memory
rm(power)
rm(power.dp)
# head(dat)
# class(dat)
# str(dat)

# Plot 3
if(file.exists("plot3.png")) {
        file.remove("plot3.png")
        warning("old file removed")
}
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow = c(1,1))
with(dat, plot(datetime, dat$Sub_metering_1,
               type = "n",
               xlab = "",
               ylab = "Energy sub metering"))
with(dat, lines(datetime, Sub_metering_1,
                col = "black"))
with(dat, lines(datetime, Sub_metering_2,
                col = "red"))
with(dat, lines(datetime, Sub_metering_3,
                col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
par(mfrow = c(1, 1))