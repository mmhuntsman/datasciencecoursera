rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data[,11] <- as.numeric(data[,11])
  data[,17] <- as.numeric(data[,17])
  data[,23] <- as.numeric(data[,23])
  
  desc <- FALSE
  rankPosition <- num
  
  if(num =="best"){
    desc <- FALSE
    rankPosition <- 1
  }
  if(num =="worst"){
    desc <- TRUE
    rankPosition <- 1
  }
  
  ## Check that state and outcome are valid
  ## Check the state is valid
  states <- unique(data[,7])
  
  if(state %in% states){
    # do nothing
  }
  else {
    stop('invalid state')
  }
  
  ## Check outcome value
  possibleOutcomes <- c('heart attack',
                        'heart failure',
                        'pneumonia'
  )
  
  if(outcome %in% possibleOutcomes ){
    if(outcome=='heart attack'){
      filter <- subset(data,State==state,
                       select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)) 
    }
    if (outcome=='heart failure'){
      filter <- subset(data,State==state,
                       select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    }
    if(outcome=='pneumonia'){
      filter <- subset(data,State==state,
                       select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)) 
    }
  }
  else{
    stop('invalid outcome')
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  #records <- filter$Hospital.Name[filter[,2] == min(filter[,2])]
  
  colnames(filter)[1] <- "Hospital"
  colnames(filter)[2] <- "Measure"
  
  #firstRecord <- data.frame(filter[, 1:2, order(filter[,2], filter[,1],)])
  firstRecord <- filter[with(filter, order(Measure,Hospital, decreasing = desc)),]
  
  ## rate
  if(rankPosition> nrow(firstRecord)){
    c <- NA
    print(c)
    
  }
  else{
    print(firstRecord[rankPosition,1])
    
    
    
  }
  
  
}