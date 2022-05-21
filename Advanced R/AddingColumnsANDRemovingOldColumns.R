# load libraries
library(readr)
library(dplyr)

# load data frame
dogs <- read_csv('C:/Users/abdul/Desktop/UDEMY Courses/Python And R Course/Sections/Advanced R/dogs.csv')

# inspect data frame
head(dogs)

# update the function call to drop all existing columns (the first argument pr second argument allows us to keep columns that we desire)
ogs <- dogs %>%
  transmute(breed = breed, avg_height = (height_low_inches + height_high_inches)/2,
            avg_weight = (weight_low_lbs + weight_high_lbs)/2,
            rank_change_13_to_16 = rank_2016 - rank_2013) 

head(dogs)
