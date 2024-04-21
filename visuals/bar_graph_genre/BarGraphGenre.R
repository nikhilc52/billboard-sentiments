
library(gganimate)
library(tidyverse)
library(ggplot2)
library(dplyr)

data <-
  read_csv("C:\\Users\\nikhi\\Downloads\\finalMatched.csv")

bar <- data %>% 
  filter(!is.na(genre)) %>% 
  filter(!is.na(`Compound Score`))


# run this for  breakdown
bar_decade <- bar %>% 
  group_by(genre,decade) %>% 
  summarise(
  sentiment = mean(`Compound Score`)
  ) %>% 
  mutate(clean_decades = case_when(
    decade == "10s"~"2010s",
    decade == "00s"~"2000s",
    decade == "90s"~"1990s",
    decade == "80s"~"1980s",
    decade == "70s"~"1970s",
    decade == "60s"~"1960s"
  ))
  


animation <- bar_decade %>% 
  ggplot(aes(x = genre, y = sentiment)) +
  geom_bar(stat = "identity",   fill = "#936eb1") +
  labs(title = "Genre Sentiment Over Time",
       x = "Genre",
       y = "Average Sentiment", subtitle ="Decade: {next_state}",
       caption="By: Rithya Sriram | Sources: Billboard Top 100, Spotify API, NLTK") + 
  theme_minimal() +
  theme(plot.title = element_text(hjust=0.5),
        plot.subtitle = element_text(hjust=0.5)) +
  transition_states(wrap = FALSE,clean_decades, transition_length = 1, state_length = 1)

animate(animation, fps = 5,end_pause=15,height=5,width=8,units="in",res=200)
#\nSemtiment Ranges From Optimsitic(1) to Pessimsitic(-1)

# run this for normal
bar_normal <- bar %>% 
 group_by(genre) %>% 
  summarise(
   sentiment = mean(`Compound Score`)
 )  %>% 
 arrange(-sentiment)

bar_normal %>% 
  ggplot(aes(x = reorder(genre,sentiment), y = sentiment)) +
 labs(title="Differences in Sentiment Across Genres", 
      subtitle="From 1960 to 2019", 
      caption="By: Rithya Sriram \n Sources: Billboard Top 100, Spotify API, NLTK") +
geom_bar(stat = "identity", fill = "#936eb1", width=0.7) +
  theme_minimal()+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5),
        axis.title = element_text(size=14,),
        axis.text.x = element_text(size=14))+
ylab("Average Song Sentiment") + 
xlab("Genre")


  
