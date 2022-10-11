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

## drop columns with player_id
top_scorers <- subset(top_scorers, select = -c(3))

## show us the top 3 scorers of each league
top_3_each <- Reduce(rbind,
                           by(top_scorers,
                              top_scorers["league_name"],
                              head,
                              n=3))

## order of league_id, drop last 2 cols
top_3_each <- top_3_each %>% arrange(league_id)%>%
  select(league_id, league_name, player_name, goals, appearances)%>%
  collect()

##create a pivot view to show this?
install.packages(pivottabler)
library(pivottabler)
pt<-PivotTable$new()
pt$addData(top_scorers)
pt$addRowDataGroups(league_name)
pt$addColumnDataGroups(appearances, goals)


## create graph showing average goals 
## per appearance by league








                      
