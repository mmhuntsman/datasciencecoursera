corr <- function(directory, threshold = 0) {
  
  # Create an empty dataframe
  allfileobservations <- complete("specdata")
  
  # Initializing an empty vector
  corvalues <- vector()
  
  # Directory logic
  currentdir <- getwd()
  
  newdir <- paste0(currentdir,sep="/",directory)
  
  setwd(newdir)
  
  
  meetsthreshold <- allfileobservations[allfileobservations$nobs > threshold,]
  
  rowcnt <- nrow(meetsthreshold)
  
  if(rowcnt >=1){
    #print(meetsthreshold)
    for(i in 1:rowcnt){
      
      id <- meetsthreshold[i,1]
      
      # Convert the id to the file name format
      filename <- sprintf("%03d.csv", id)
      
      # Add the file name to the path
      filepath <- paste0(getwd() ,sep ="/",filename)
      
      # Read the data in the file
      data <- read.csv(filepath, head=TRUE, sep=",")
      
      sulfate <- data[,2]
      nitrate <- data[,3]
      
      # Calculate the correlation
      a <- cor(sulfate, nitrate, use="complete.obs", method="pearson")
      
      corvalues <- append(corvalues, a, after = length(corvalues))
      #print(a)
      # Data frame for every file
      #fileobservations <-  data.frame(id= i, nobs= nrow(na.omit(data)))
      
      # Append the newly created df to the existing df
      #df <- rbind(df,fileobservations)
    }
    setwd(currentdir)
    
    corvalues
  }
  else {
    setwd(currentdir)
    
    vec <- 0
    vec
  }
}