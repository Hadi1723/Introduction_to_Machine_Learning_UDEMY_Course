# load libraries
library(readr)
library(dplyr)

# load data frame
artists <- read_csv('C:/Users/abdul/Desktop/UDEMY Courses/Python And R Course/Sections/Advanced R/artists.csv')

# select columns
chosen_cols <- artists %>% 
  select(-country,-year_founded,-albums)
head(chosen_cols)

# filter rows (selecting rows)
popular_not_hip_hop <- chosen_cols %>% 
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') 
head(popular_not_hip_hop)

# arrange rows
youtube_desc <- popular_not_hip_hop %>% 
  arrange(desc(youtube_subscribers))
head(youtube_desc)

# select columns, filter and arrange rows
artists <- artists %>% 
  select(-country,-year_founded,-albums) %>% 
  filter(spotify_monthly_listeners > 20000000, genre != 'Hip Hop') %>% 
  arrange(desc(youtube_subscribers))
head(artists)
