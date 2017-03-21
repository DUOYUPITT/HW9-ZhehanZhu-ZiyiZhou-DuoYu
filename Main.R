##########################
####### Homework 9 #######
##########################

install.packages("ggplot2")
library(ggplot2)

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


#2. PlotByTime<-function(time, count). This function treats CaseID like a time variable (small to large) 
#and plot the number of family members that utilize mental health services in each case. 
#Put this in: Plotting.R

PlotByTime <- function(time, count){
  dat <- data.frame(time, count)
  ggplot(dat, aes(time, count)) + geom_line()
}


#3. a script in main.R that reads in DHSMini.csv, then call AggregateByCase and send its output to PlotByTime. 
# Read the dataset
setwd("C:/Users/Tiffany/Documents/1- Study/PITT/4- Spring 2017/PIA 2096 - R Programming/3-Assignments/HW 9")
dat <- read.csv("DHSMini.csv")
CaseID <- dat$CaseID
MH1 <- dat$MH1

# Call the function of AggregateByCase
countMH <- AggregateByCase(CaseID, MH1) 
colnames(countMH) <- c("CaseID", "Number of MH") #Assign the column names

# Send the above output to the funcion of PlotByTime
graphic <- PlotByTime(countMH$CaseID, countMH$`Number of MH`)
graphic + labs(x="CaseID", y="Number of family members utilized MH")

