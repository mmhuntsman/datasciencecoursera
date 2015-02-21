pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332){
  currentdir <- getwd()
  
  newdir <- paste0(currentdir,sep="/",directory)
  
  setwd(newdir)
  
  # Initializing an empty vector
  pollutantvalues <- vector()
  
  for(i in id){
    
    # Convert the id to the file name format
    filename <- sprintf("%03d.csv", i)
    
    # Add the file name to the path
    filepath <- paste0(getwd() ,sep ="/",filename)
    
    # Read the data in the file
    data <- read.csv(filepath, head=TRUE, sep=",")
    
    # Subset of polutant
    filevalues <- data[,pollutant]
    
    
    
    pollutantvalues <- append(pollutantvalues, filevalues, after = length(pollutantvalues))
    
    # Calculate the Mean for the given pollutant by removing all NA
    #filepollutantmean <- mean(data[,pollutant], na.rm = TRUE)
    
    #filepollutantmean
  }
  
  Totalmean <- mean(pollutantvalues, na.rm = TRUE)
  setwd(currentdir)
  print(Totalmean)
  
}