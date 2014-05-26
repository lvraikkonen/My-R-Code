getwd()
setwd("C:/Users/v-shuolv/Documents/GitHub/My-R-Code")

## Part 1
outcome <- read.csv("outcome-of-care-measures.csv",
                    colClasses = 'character')
head(outcome)
ncol(outcome)
names(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])


## Part 2 --  Solution 1
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
  
  ## Check that state and outcome are valid
  if(!(state %in% hospDF[,7])) stop("Invalid State Name!")
  if(!(outcome %in% c('heart attack','heart failure','pneumonia'))) stop("Invalid Outcome Name!")
  
  States <- hospDF[,7]
  Hosptial.Name <- as.character(hospDF[,2])
  Heart.Attack <- suppressWarnings(as.numeric(hospDF[,11]))
  Heart.Failure <- suppressWarnings(as.numeric(hospDF[,17]))
  Pneumonia <- suppressWarnings(as.numeric(hospDF[,23]))
  
  data <- data.frame(States,Hosptial.Name,Heart.Attack,Heart.Failure,Pneumonia,
                     stringsAsFactors=FALSE)
  
  stateData <- data[data$States == state,]
  
  ## Return hospital name in that state with lowest 30-day death
  if(outcome == 'heart attack'){
    minRate <- min(stateData[,3],na.rm=TRUE)
    result <- stateData[stateData[,3] == minRate,]
  }
  if(outcome == 'heart failure'){
    minRate <- min(stateData[,4],na.rm=TRUE)
    result <- stateData[stateData[,4] == minRate,]
  }
  if(outcome == 'pneumonia'){
    minRate <- min(stateData[,5],na.rm=TRUE)
    result <- stateData[stateData[,5] == minRate,]
  }
  bestHospital <- result[complete.cases(result),]$Hosptial.Name
  
  ## rate
  return(bestHospital)
}


## Part 2 --  Solution 2
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


## Part 3
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  hospDF <- read.csv("outcome-of-care-measures.csv",
                     colClasses = 'character',
                     stringsAsFactors= FALSE)
  
  ## Check that state and outcome are valid
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
    stop("Invalid State Name!")
  }
  
  # get the state data
  data <- hospDF[hospDF$State == state, c(2,7,colNum)]
  data[,3] <- suppressWarnings(as.numeric(data[,3]))
  
  ## Return hospital name in that state with the given rank
  if(num == "best"){
    rankNum <- 1
    desc <- FALSE #Lower better
  }else if(num == "worse"){
    rankNum <- 1
    desc  <- TRUE
  }else{
    rankNum <- num
    desc <- FALSE
    if(num > nrow(data))
      return(NA)
  }
  
  result <- data[order(
    as.numeric(data[,3]),
    data[,1],
    na.last=NA,
    decreasing = desc),]
  
  
  #return hospital name
  return(result[rankNum,]$Hospital.Name)
}