complete <- function(directory, id = 1:332) {
  currentdir <- getwd()
  
  newdir <- paste0(currentdir,sep="/",directory)

  setwd(newdir)

  # Create an empty dataframe
  df <- data.frame(id= numeric(0), nobs= numeric(0))
  
  for(i in id){
    
    # Convert the id to the file name format
    filename <- sprintf("%03d.csv", i)
    
    # Add the file name to the path
    filepath <- paste0(getwd() ,sep ="/",filename)
    
    # Read the data in the file
    data <- read.csv(filepath, head=TRUE, sep=",")
    

    # Data frame for every file
    fileobservations <-  data.frame(id= i, nobs= nrow(na.omit(data)))
    
    # Append the newly created df to the existing df
    df <- rbind(df,fileobservations)
  }
  
  setwd(currentdir)
  df
}