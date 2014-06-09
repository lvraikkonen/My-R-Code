## Finding the best hospital in a state
best <- function(state,outcome){
  ## Read outcome data
  hospDF <- read.csv("outcome-of-care-measures.csv",
                     colClasses = 'character',
                     stringsAsFactors= FALSE)
  ## col  7: State
  ## col 11: Heart Attack
  ## col 17: Heart Failure
  ## col 23: Pneumonia
  
  # Check that state is valid
  if(!(state %in% hospDF$State)){
    stop("Invalid State Name!")
  }
  
  # Check that outcome is valid
  if(outcome == 'heart attack'){
    colNum <- 11
  }
  else if(outcome == 'heart failure'){
    colNum <- 17
  }
  else if(outcome == 'pneumonia'){
    colNum <- 23
  }
  else{
    stop("Invalid Outcome Name!")
  }
  
  # get the state data
  data <- hospDF[hospDF$State == state, c(2,7,colNum)]
  data[,3] <- suppressWarnings(as.numeric(data[,3]))
  
  ## Return hospital name in that state with lowest 30-day death
  minRate <- min(data[,3],na.rm=TRUE)
  result <- data[data[,3]==minRate,]
  result <- result[complete.cases(result),]
  
  ## rate
  return(result$Hospital.Name)
}