
source ("getData.R")

createPlot4 <- function() 
{
  ## get the data for the two days
  cat ("data")
  data = getData()
  str (data)
  
  ## convert the columns of interest to numeric
  data$Global_active_power = as.numeric (data$Global_active_power)	
  data$Global_reactive_power = as.numeric (data$Global_reactive_power)
  data$Voltage = as.numeric (data$Voltage)
  
  data$Sub_metering_1 = as.numeric (data$Sub_metering_1)
  data$Sub_metering_2 = as.numeric (data$Sub_metering_2)
  data$Sub_metering_3 = as.numeric (data$Sub_metering_3)
  
  ## create a new DateTime column
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  
  ## just for a diagnostic, show the processed data frame
  cat ("processed data frame")
  str (data)
  
  ## open the graphics device
  png (filename = "plot4.png")
  
  ## setup the graphics parameters
  par (bg = "transparent")
  par (mfcol = c(2, 2))
  
  ## top left = plot 2
  ## create the line plot
  cat ("plot 2")
  plot (data$datetime,
        data$Global_active_power, 
        type = "l",
        ylab="Global Active Power",
        xlab="")
  
  ## bottom left = plot 3
  ## create the plot frame
  cat ("plot 3")
  plot (data$datetime,
        data$Sub_metering_1, 
        type = "n",
        ylab = "Energy sub metering",
        xlab = "")
  
  ## draw the lines
  lines (data$datetime, data$Sub_metering_1, col="black")
  lines (data$datetime, data$Sub_metering_2, col="red")
  lines (data$datetime, data$Sub_metering_3, col="blue")
  
  ## make the legend
  legend ("topright", 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
          col = c("black", "red", "blue"),
          lwd = c(1,1,1,1),
          bty = "n")
  
  ## top right = plot Voltage
  with (data, plot (datetime,
        Voltage, 
        type = "l"))
  
  ## bottom right = plot Global Reactive Power
  with (data, plot (datetime,
        Global_reactive_power, 
        type = "l"))
  
  ## close the graphics device (which saves the PNG)
  dev.off()
}