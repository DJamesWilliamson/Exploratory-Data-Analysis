Projects for Exploratory Data Analysis Course
===================================================================
### Data source:
[Link to data] (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

Beware, large dataset
2,075,259 rows and 9 columns
2075259 * 9 * 8 / 2^20       ~140 Mb RAM required

### The following descriptions of the 9 variables in the dataset
are taken from the UCI web site:
[Link to description] (https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)
        
Date: Date in format dd/mm/yyyy
Time: time in format hh:mm:ss
Global_active_power: household global minute-averaged active power (in kilowatt)
Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
Voltage: minute-averaged voltage (in volt)
Global_intensity: household global minute-averaged current intensity (in ampere)
Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy).
        It corresponds to the kitchen, containing mainly a dishwasher, an oven 
        and a microwave (hot plates are not electric but gas powered).
Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy).
        It corresponds to the laundry room, containing a washing-machine, 
        a tumble-drier, a refrigerator and a light.
Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy).
        It corresponds to an electric water-heater and an air-conditioner.

### This repository contains the following items:

* R scripts to download the data and generate the plots in a png file
* The png files which duplicate those given in the exercise

### Required packages:
* dplyr
* lubridate