
library(gganimate)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)

data <-
  read_csv("C:\\Users\\nikhi\\Downloads\\finalMatchedUpdated.csv")

bar <- data %>% 
  filter(!is.na(genre))

bar$Explicitives[bar$Explicitives == 99] <- 0
bar$Explicitives[bar$Explicitives == 75] <- 0
bar$Explicitives[bar$Explicitives == 61] <- 0

bar_normal <- bar %>% 
 group_by(genre) %>% 
  summarise(
   cursePerSong = sum(Explicitives)/n()
 )


box <- bar %>% 
  summarise(
    Explicitives = Explicitives,
    Genre = genre
  )




bar_normal %>% 
  ggplot(aes(x = reorder(genre,cursePerSong), y = cursePerSong, fill=reorder(genre,cursePerSong))) +
 labs(title="Differences in Expletives Across Genres", 
      subtitle="From 1960 to 2019", 
      caption="By: Nikhil Chinchalkar \n Sources: Billboard Top 100, Spotify API") +
geom_bar(stat = "identity", width=0.7) +
  scale_fill_manual(values = c("#cc489c","#936eb1","#52b5e7","#52b5e7","#936eb1","#cc489c"))+
  theme_minimal()+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5),
        axis.title = element_text(size=14,),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14))+
ylab("Number of Expletives Per Song") + 
xlab("Genre")

box |> 
  ggplot(aes(x=reorder(Genre,Explicitives), y=Explicitives, fill=reorder(Genre,Explicitives)))+
  geom_boxplot()+
  scale_fill_manual(values = c("#cc489c","#936eb1","#52b5e7","#52b5e7","#936eb1","#cc489c"))+
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_minimal()+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5),
        axis.title = element_text(size=14,),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14))+
  ylab("Number of Expletives Per Song") + 
  xlab("Genre")+
  labs(title="Differences in Expletives Across Genres", 
       subtitle="From 1960 to 2019", 
       caption="By: Nikhil Chinchalkar \n Sources: Billboard Top 100, Spotify API")
  
box |> 
  filter(Explicitives > 0) |>
  ggplot(aes(x=reorder(Genre,Explicitives), y=Explicitives, fill=reorder(Genre,Explicitives)))+
  geom_boxplot()+
  scale_fill_manual(values = c("#cc489c","#936eb1","#52b5e7","#52b5e7","#936eb1","#cc489c"))+
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_minimal()+
  theme(plot.title = element_text(size = 22, hjust =0.5, face = "bold"), 
        plot.subtitle = element_text(size = 16, hjust =0.5),
        axis.title = element_text(size=14,),
        axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14))+
  ylab("Number of Expletives Per Song") + 
  xlab("Genre")+
  labs(title="Differences in Expletives Across Genres", 
       subtitle="From 1960 to 2019, Excluding Clean Songs", 
       caption="By: Nikhil Chinchalkar \n Sources: Billboard Top 100, Spotify API")

