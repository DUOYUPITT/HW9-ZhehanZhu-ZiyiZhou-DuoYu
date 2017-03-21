#2. PlotByTime<-function(time, count). This function treats CaseID like a time variable (small to large) 
#and plot the number of family members that utilize mental health services in each case. 
#Put this in: Plotting.R

PlotByTime <- function(time, count){
  dat <- data.frame(time, count)
  ggplot(dat, aes(time, count)) + geom_line() 
} 