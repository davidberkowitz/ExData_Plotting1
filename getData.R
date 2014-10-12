
getData <- function() 
{
  ## does the RDS file already exist?
  
  if (file.exists("data.rds"))
  {
    cat ("data.rds already exists - returning it\n")
    data <- readRDS("data.rds")
    return (data)
  }
  cat ("data.rds does not exist - creating it\n")
  
  ## does the txt file already exist?
  if (!file.exists("household_power_consumption.txt"))
  {
    ##  get it
    cat ("downloading the zip file\n")
    system ("curl --get https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip >data.zip")
    
    ## unzip it
    cat ("unzipping the zip file\n")
    system ("unzip -q data.zip")
  }
  
  ## by now we must have what we need
  cat ("household_power_consumption.txt exists - processing it\n")
  
  ## read in the complete data file
  ## separator is ";" so use read.csv2
  cat ("outcomes\n")
  outcomes <- read.csv2 ("household_power_consumption.txt", colClasses = "character")
  str (outcomes)
  
  cat ("dayOne\n")
  dayOne = subset (outcomes, outcomes$Date=="1/2/2007")
  str (dayOne)
  
  cat ("dayTwo\n")	
  dayTwo = subset (outcomes, outcomes$Date=="2/2/2007")
  str (dayTwo)
  
  # combine them into a single data frame
  cat ("data\n")	
  data = rbind(dayOne, dayTwo)
  str (data)
  
  # write out the data to a file
  saveRDS(data, file="data.rds")
  
  return (data)
  
}