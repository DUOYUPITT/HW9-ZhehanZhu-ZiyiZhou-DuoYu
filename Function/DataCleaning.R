#1. AggregateByCase<-function(group,x). This computes # of non NAs in MH for every CaseID. 
#The result of this function should be a data frame where each row is a case with a case ID and # of 
#individuals using mental health services. 
#Put this in: DataCleaning.R 

AggregateByCase<-function(group,x){
  group_uni <- sort(unique(group))
  count <- NULL
  j <- 1
  for (i in group_uni){
    count[j] <- length((which(group==i & (!is.na(x)))))
    j <- j+1
  }
  result <- data.frame(group_uni, count)
  return(result)
}
