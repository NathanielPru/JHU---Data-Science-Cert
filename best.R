 

best <- function(state, outcome) {
  ## Read outcome data

  setwd("C:/Users/gfdas/OneDrive/Desktop/Data Science/R Projects/JHU---Data-Science-Cert/ProgrammingAssignment3")
  
  outcomedata <- read.csv("outcome-of-care-measures.csv",na.strings = "Not Available"
                          ,stringsAsFactors = FALSE,  colClasses = "character")
  
  
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
  
  
  tempdata <- data.frame(outcomedata[outcomedata$State == state,])
 
  tempmin <- min(as.numeric(unlist(tempdata[outcomename])),na.rm=TRUE)
  
  i <- which(as.numeric(unlist(tempdata[outcomename])) == tempmin)

  sort(tempdata$Hospital.Name[i])
  
}

