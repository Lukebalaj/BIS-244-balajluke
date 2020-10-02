rm(list=ls(all=TRUE))
cat("/014")
library(tidyverse)
Temp <-getwd()
#setwd("./covid-19-data/")
COUNTIES <- read.csv("us-counties.csv")
setwd(Temp)
view(COUNTIES)
LEHIGH <-filter(COUNTIES,state=="Pennsylvania" & county=="Lehigh")
View(LEHIGH)
n <- length(LEHIGH$date)
LEHIGH$ncr_cases <- 1
View(LEHIGH)

#for (i in 2:n) {
# LEHIGH$ncr_cases[i] <- (LEHIGH$cases[i]-LEHIGH$cases[i-1])
#}

#View(LEHIGH)  

#plot
p<- ggplot()
p + geom_point(data=LEHIGH,
               mapping = aes(x = date,
                             y = deaths, color="deaths")) +
  geom_point(data=LEHIGH,
             mapping = aes(x = date,
                           y = cases,color="cases")) + 
  labs(color="legend",x = "Dates", y = "Incrimental Cases",
       title = "COVID-19 Cases in Lehigh County, PA",
       subtitle = "Data points are incrimental new confirmed cases",
       caption = "Source: NY Times") + 
  theme(legend.position = c(0.1, 1),legend.justification = c(0.1, 1))+
  scale_color_manual(values = c("blue","red"))

