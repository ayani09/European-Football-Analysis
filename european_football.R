## code


library(readxl)
library(readr)
library(dplyr)
library(janitor)
library(tidyverse)
library(tidyr)


##read in data
top_scorers <- read.csv("top scorers.csv", header = T)

## clean up the column headers
# first headers should match first row names, then drop the first row (as it is repeated)

names(top_scorers) <- top_scorers[1,]
top_scorers <- top_scorers[-1,]

## drop columns with IDs
top_scorers <- subset(top_scorers, select = -c(1,3))

## show us the top 3 scorers of each league
top_3_each <- top_scorers %>%
  select (league_name, player_name, goals, appearances)%>%
  pivot_wider(names_from = "league_name", values_from = "goals")%>%
  collect()
