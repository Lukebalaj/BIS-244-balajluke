#Luke Balaj
#Set WD

cat("\014")
setwd("~/Documents/BIS244/BIS-244-balajluke")

#library
library(ggplot2)
library(readr)
library(tidyverse)
library(dplyr)
library(scales)

#read
covid <- read.csv("data.csv")

#cleaning up and filtering data
newdata <- covid %>% filter(countriesAndTerritories == "Canada" | countriesAndTerritories == "France" | countriesAndTerritories =="Germany" | countriesAndTerritories =="Italy" | countriesAndTerritories == "Japan" | countriesAndTerritories == "United_Kingdom" | countriesAndTerritories == "United_States_of_America")
newdata$dateRep <- as.Date(newdata$dateRep, "%d/%m/%y")

#plotting data on line graph
p <- ggplot(data = newdata, mapping = aes(x = dateRep, y = cases, color = countriesAndTerritories))
p + geom_line(mapping = aes(group = countriesAndTerritories)) +
  labs(x = NULL, y = "New Cases per Day", title = "G7 COVID-19 Case Counts",
       subtitle = "by Luke Balaj as of 2020-10-15",
       caption = "Data: ECDC Times") +
  scale_x_date(limits = as.Date(c("2019-12-31","2020-10-16"))) 

