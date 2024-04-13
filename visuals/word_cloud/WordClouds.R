library(tidyverse)
library(gt)
library(gtExtras)
library(ggimage)
library(ggthemes)
library(ggrepel)
library(dplyr)

library(gganimate)
library(transformr)
library(av)

library(ggplot2)
library(ggwordcloud)




data <- read.csv("C:\\Users\\nikhi\\Downloads\\frequencyPerYearClean.csv")
averages <- read.csv("C:\\Users\\nikhi\\Downloads\\averages.csv")

testing <- averages |> 
  group_by(Year) |> 
  top_n(1, Rolling.Average)

###########################################
#cloud <- cloud |> 
#  group_by(Year) |> 
#  top_n(10, Count)

#write.csv(cloud, "C:\\Users\\nikhi\\Downloads\\cloud.csv", row.names=FALSE)

#set.seed(42)
#plot <- cloud  |> 
#  ggplot(aes(label = Word, size=Count)) +
#  geom_text_wordcloud() +
# scale_size_area(max_size = 30) +
#  theme_minimal()


#plot2 <- plot + transition_time(Year) +
#  labs(title = 'Year: {frame_time}')

#animate(plot2, fps = 1, end_pause=30)

##################################
set.seed(42)
plot <- averages  |> 
  filter(Rolling.Average > 0) |> 
  ggplot(aes(label = Word, size=Rolling.Average)) +
  geom_text_wordcloud() +
  scale_size_area(max_size = 30) +
  theme_minimal()


plot2 <- plot + transition_time(Year) +
  labs(subtitle = 'Year: {frame_time}')+
  labs(title = "Top Words Of Billboard Songs", 
       caption="By: Nikhil Chinchalkar\nData: Billboard 100, LyricsGenius (Genius API), NTLK")+
  theme(
    plot.title = element_text(size = 16, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5)
  )
  

animate(plot2, fps=5, height = 5, end_pause=25,
        width = 5, units = "in", res = 150)
###############################