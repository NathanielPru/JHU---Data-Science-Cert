 

best <- function(state, outcome) {
  ## Read outcome data
  outcomedata <- read.csv("outcome-of-care-measures.csv",na.strings = "Not Available"
                          ,stringsAsFactors = FALSE,  colClasses = "character")
  
  state <- "TX"
  outcome <- "heart attack"
  ## Check that state and outcome are valid
  if (state %in% outcomedata$State == FALSE) {
    stop("invalid state")
  }
  
  if (outcome %in% c("heart attack","heart failure","pneumonia") == FALSE) {
    stop("invalid outcome")
    
  } else if (outcome == "heart attack") {
    outcomename <- colnames(outcomedata)[11]
    
  } else if (outcome == "heart failure") {
    outcomename <- colnames(outcomedata)[17]
    
  } else if (outcome == "pneumonia") {
    outcomename <- colnames(outcomedata)[23]
    
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  min(as.numeric(unlist(outcomedata[outcomename])),na.rm=TRUE)
  
}

outcomename

x<-as.numeric(unlist(outcomedata[outcomename]))
x
summary(outcomedata[outcomename])
