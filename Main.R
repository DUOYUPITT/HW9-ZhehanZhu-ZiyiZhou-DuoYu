install.packages("ggplot2")
library(ggplot2)

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

