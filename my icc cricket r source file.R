# IMPORTING LIBRARIES
library(rvest) 
library(dplyr)
library(robotstxt)

path = paths_allowed ("https://www.icc-cricket.com/rankings/mens/player-rankings/t20i/batting")

link <-"https://www.icc-cricket.com/rankings/mens/player-rankings/t20i/batting"

web <- read_html (link) 

name <- web %>% html_nodes (".name a , .rankings-block__banner--name-large")%>% html_text()

View (name)  

country<- web %>% html_nodes(".rankings-table__team , .rankings-block__banner--nationality") %>% html_text()

View(country)

icc.rankings <- data.frame(name,country)

write.csv (icc.rankings, "My icc cricket.csv")
