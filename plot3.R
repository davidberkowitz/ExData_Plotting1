source ("getData.R")

createPlot3 <- function() 
{
  ## get the data for the two days
  cat ("data")
  data = getData()
  str (data)

	## convert the columns of interest to numeric
	cat ("Sub_metering\n")	
	data$Sub_metering_1 = as.numeric (data$Sub_metering_1)
	data$Sub_metering_2 = as.numeric (data$Sub_metering_2)
	data$Sub_metering_3 = as.numeric (data$Sub_metering_3)
	str (data)
	
	## create a new DateTime column
	data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
		
	## open the graphics device
	png (filename = "plot3.png")
	
	## setup the graphics parameters
	par (bg = "transparent")
	
	## create the plot frame
	plot (data$DateTime,
		data$Sub_metering_1, 
		type = "n",
		ylab="Energy sub metering",
    xlab="")

  ## draw the lines
	lines (data$DateTime, data$Sub_metering_1, col="black")
	lines (data$DateTime, data$Sub_metering_2, col="red")
	lines (data$DateTime, data$Sub_metering_3, col="blue")
  
  ## make the legend
	legend ("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), , lwd=c(2.5,2.5,2.5))
  
	## close the graphics device (which saves the PNG)
	dev.off()
}