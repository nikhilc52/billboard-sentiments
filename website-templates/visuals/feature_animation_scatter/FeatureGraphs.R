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



df <- read.csv("C:\\Users\\nikhi\\Downloads\\finalMatched.csv")

df$Compound.Score <- as.numeric(as.character(df$Compound.Score))

df <- df |> 
  mutate(colorGenre = case_when(
    genre == "rock" ~ "blue",
    genre == "pop" ~ "pink",
    genre == "r%b" ~ "brown",
    genre == "edm" ~ "grey",
    genre == "latin" ~ "yellow",
    genre == "rap" ~ "red",
    .default = "black"
  ))

animation <- df |> 
  filter(!is.na(Compound.Score)) |>  
  ggplot(aes(x = energy, y = danceability))+
  geom_point(aes(group = seq_along(Year)), size=7, shape=20) + 
  scale_color_identity(aesthetics = c("fill","color"))+
  theme_fivethirtyeight()+  
  scale_x_continuous(breaks=scales::pretty_breaks(n=8))+
  scale_y_continuous(breaks=scales::pretty_breaks(n=8))+
  theme(axis.title = element_text())+
  ylab("Danceability") +
  xlab("Energy")+
  labs(subtitle = 'Year: {next_state}')+
  labs(title="Energy and Danceability of Top Songs Since 1960", 
       caption="By: Nikhil Chinchalkar\nData: Billboard 100, Spotify API, NTLK")+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5))+
  xlim(0,1)+
  ylim(0,1)+
  transition_states(Year, transition_length = 1, state_length = 1, wrap = FALSE)+
  theme(panel.background = element_rect(fill="white", color="white"))+
  theme(plot.background = element_rect(fill="white", color="white"))+
  theme(legend.background = element_rect(fill="white", color="white"))+
  theme(legend.box.background = element_rect(fill="white", color="white"))


animate(animation, fps = 5, duration = 15, end_pause=30, height = 7,
        width = 9, units = "in", res = 200)

point <- df |> 
  filter(!is.na(Compound.Score)) |> 
  filter(!is.na(energy)) |> 
  group_by(Year) |> 
  summarize(
    energy = mean(energy),
    danceability = mean(danceability),
    tempo = mean(tempo),
    duration_s = mean(duration_s)
  )


animation2 <- point |> 
  ggplot(aes(x = energy, y = danceability))+
  geom_line(aes(color=Year), size=1.5) +
  scale_color_gradient(low="#fff100", high="#e20a17")+
  theme_fivethirtyeight()+  
  scale_x_continuous(breaks=scales::pretty_breaks(n=8))+
  scale_y_continuous(breaks=scales::pretty_breaks(n=8))+
  theme(axis.title = element_text())+
  ylab("Danceability") +
  xlab("Energy")+
  labs(subtitle = paste('Year: {frame_along}', "\n\nWhere the colored line represents the average score for each year"))+
  labs(title="Energy and Danceability of Top Songs Since 1960", 
       caption="By: Nikhil Chinchalkar\nData: Billboard 100, Spotify API, NTLK")+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5))+
  guides(color = guide_legend(
    title="Averages for Each Year",
    label.position = "bottom"))+ 
  xlim(0,1)+
  ylim(0,1)+
  transition_reveal(Year)+
  theme(panel.background = element_rect(fill="white", color="white"))+
  theme(plot.background = element_rect(fill="white", color="white"))+
  theme(legend.background = element_rect(fill="white", color="white"))+
  theme(legend.box.background = element_rect(fill="white", color="white"))+
  theme(legend.title = element_text( size=5), legend.text=element_text(size=5))
  

animate(animation2, fps = 5, end_pause=30, height = 8,
        width = 10, units = "in", res = 200)


#################
#static start/end

df |> 
  filter(!is.na(Compound.Score)) |>  
  filter(Year == 2019) |> 
  ggplot(aes(x = energy, y = danceability))+
  geom_point(size=7, shape=20) + 
  scale_color_identity(aesthetics = c("fill","color"))+
  theme_fivethirtyeight()+  
  scale_x_continuous(breaks=scales::pretty_breaks(n=8))+
  scale_y_continuous(breaks=scales::pretty_breaks(n=8))+
  theme(axis.title = element_text())+
  ylab("Danceability") +
  xlab("Energy")+
  labs(subtitle = 'Year: 2019')+
  labs(title="Energy and Danceability of Top Songs Since 1960", 
       caption="By: Nikhil Chinchalkar\nData: Billboard 100, Spotify API, NTLK")+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5))+
  xlim(0,1)+
  ylim(0,1)+
  theme(panel.background = element_rect(fill="white", color="white"))+
  theme(plot.background = element_rect(fill="white", color="white"))+
  theme(legend.background = element_rect(fill="white", color="white"))+
  theme(legend.box.background = element_rect(fill="white", color="white"))
