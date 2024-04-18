library(tidyverse)
library(gt)
library(gtExtras)
library(ggimage)
library(ggthemes)
library(ggrepel)
library(dplyr)
library(zoo)

library(gganimate)
library(transformr)
library(av)


dataset <- read.csv("C:\\Users\\nikhi\\Downloads\\finalMatched.csv")


dataset$Compound.Score <- as.numeric(as.character(dataset$Compound.Score))

dataset <- dataset |> 
  mutate(negative = ifelse(Compound.Score < 0, 1, 0)) |> 
  mutate(positive = ifelse(Compound.Score > 0, 1, 0))

testing <- dataset |> 
  filter(genre == "rap") |> 
  summarize(
    year= Year,
    name = track,
    artist = artist,
    score = Compound.Score
  )

lines <- dataset |> 
  group_by(Year) |> 
  filter(!is.na(Compound.Score)) |> 
  filter(Compound.Score != 0) |> 
  summarize(
    scoreAverage = mean(Compound.Score),
    countNegative = sum(negative),
    countPositive = sum(positive)
  ) |> 
  mutate(RANegative = rollmean(countNegative, k = 5, fill = NA, align="right")) |> 
  mutate(RAPositive = rollmean(countPositive, k = 5, fill = NA, align="right"))


animation <- lines |> 
  filter(!is.na(RANegative)) |> 
  ggplot() +
  geom_line(aes(x=Year, y=RANegative, color="Negative"), size=2)+
  geom_line(aes(x=Year, y=RAPositive, color="Positive"), size=2)+
  scale_color_identity(aesthetics = c("fill","color"))+
  scale_color_manual(values = c("Negative" = "#cc489c", "Positive" = "#52b5e7"), 
                     name = "Sentiment")+
  theme_fivethirtyeight()+
  scale_x_continuous(breaks=scales::pretty_breaks(n=8))+
  scale_y_continuous(breaks=scales::pretty_breaks(n=8))+
  theme(axis.title = element_text())+
  transition_reveal(Year)+
  ylab("Percent of Top 100") +
  xlab("Year")+
  labs(subtitle = 'Year: {frame_along}')+
  labs(title="Sentiment Of The Billboard Top 100 Songs",
       subtitle="Measured as a percent of songs with a positive/negative NLTK sentiment score",
       caption="By: Nikhil Chinchalkar\nData: Billboard 100, NTLK")+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5))+
  guides(color = guide_legend(title.position = "top", 
                              title.hjust = 0.5,
                              label.position = "bottom"))+
  theme(legend.title = element_text( size=9), legend.text=element_text(size=9))+
  theme(panel.background = element_rect(fill="white", color="white"))+
  theme(plot.background = element_rect(fill="white", color="white"))+
  theme(legend.background = element_rect(fill="white", color="white"))+
  theme(legend.box.background = element_rect(fill="white", color="white"))



animate(animation, fps = 5, duration = 15, end_pause=5, height = 7,
        width = 9, units = "in", res = 200)

###############################
#static image:

static <- lines |> 
  filter(!is.na(RANegative)) |> 
  ggplot() +
  geom_line(aes(x=Year, y=RANegative, color="Negative"), size=2)+
  geom_line(aes(x=Year, y=RAPositive, color="Positive"), size=2)+
  scale_color_identity(aesthetics = c("fill","color"))+
  scale_color_manual(values = c("Negative" = "#cc489c", "Positive" = "#52b5e7"), 
                     name = "Sentiment")+
  theme_fivethirtyeight()+
  scale_x_continuous(breaks=scales::pretty_breaks(n=8))+
  scale_y_continuous(breaks=scales::pretty_breaks(n=8))+
  theme(axis.title = element_text())+
  ylab("Percent of Top 100") +
  xlab("Year")+
  labs(subtitle = 'Year: {frame_along}')+
  labs(title="Sentiment Of The Billboard Top 100 Songs",
       subtitle="Measured as a percent of songs with a positive/negative NLTK sentiment score",
       caption="By: Nikhil Chinchalkar\nData: Billboard 100, NTLK")+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5))+
  guides(color = guide_legend(title.position = "top", 
                              title.hjust = 0.5,
                              label.position = "bottom"))+
  theme(legend.title = element_text( size=9), legend.text=element_text(size=9))+
  theme(panel.background = element_rect(fill="white", color="white"))+
  theme(plot.background = element_rect(fill="white", color="white"))+
  theme(legend.background = element_rect(fill="white", color="white"))+
  theme(legend.box.background = element_rect(fill="white", color="white"))

ggsave("static.png")
