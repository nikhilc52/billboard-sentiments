
library(gganimate)
library(tidyverse)
library(ggplot2)

data <-
  read_csv("/Users/rithyasri/Downloads/finalMatched.csv")

bar <- data %>% 
  filter(!is.na(genre)) %>% 
  filter(!is.na(`Compound Score`))


# run this for  breakdown
bar <- bar %>% 
  group_by(genre,decade) %>% 
  summarise(
  sentiment = mean(`Compound Score`)
  )
  
bar <- decade %>%
  ifelse(. <=10, . + 19, . + 00)
  

bar %>% 
  ggplot(aes(x = genre, y = sentiment)) +
  geom_bar(stat = "identity",   fill = "#cc489c") +
  labs(title = "Breakdown by Decade",
       x = "Genre",
       y = "Total Sentiment", subtitle = "Decade: {closest_state}") + 
  theme_minimal() +
  theme(plot.title = element_text(hjust=0.5),
        plot.subtitle = element_text(hjust=0.5)) +
  transition_states(decade, transition_length = 1, state_length = 1)



# run this for normal
bar <- bar %>% 
 group_by(genre) %>% 
  summarise(
   sentiment = mean(`Compound Score`)
 )  %>% 
 arrange(-sentiment)

bar %>% 
  ggplot(aes(x = reorder(genre,sentiment), y = sentiment)) +
 labs(title="Sentiment in Comparison to Genre", 
      subtitle="", 
      caption="By: Rithya Sriram \n Sources: Billboard Top 100, Genius API") +
geom_bar(stat = "identity", fill = "#cc489c") +
  theme_minimal()+
theme(plot.title = element_text(hjust=0.5)) +
ylab("Sentiment") + 
xlab("Genre")


  
