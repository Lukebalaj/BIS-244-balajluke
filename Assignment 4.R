library(ggplot2)
library(scales)

#set working directory
setwd("~/Documents/BIS244/BIS-244-balajluke")

#csv to df
twitch <- read.csv("Most Popular Twitch Streamers.csv")

#clean up the date
twitch$Date <- as.Date(twitch$Date, "%m/%d/%Y")

#grouping long data
p <- ggplot(data = twitch, mapping = aes(x = Date,
                                         y = Viewers, color = Streamer))
#Big Graph
p + geom_line(mapping = aes(group = Streamer)) +
  scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6)) +
  labs(x = "Date",
       y = "Viewers",
       title = "Most Popular Twitch Streamers")

#Smaller Graphs
p + geom_line(mapping = aes(group = Streamer)) +
  labs(x = "Date",
       y = "Viewers",
       title = "Most Popular Twitch Streamers") +
  facet_wrap(~ Streamer)