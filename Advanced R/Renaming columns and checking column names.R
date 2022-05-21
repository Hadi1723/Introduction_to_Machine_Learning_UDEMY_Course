# load libraries
library(readr)
library(dplyr)

# load data frame
dogs <- read_csv('dogs.csv')

# add columns and remove existing columns
dogs <- dogs %>%
  transmute(breed = breed,
            avg_height = (height_low_inches + height_high_inches)/2,
            avg_weight = (weight_low_lbs + weight_high_lbs)/2,
            rank_change_13_to_16 = rank_2016 - rank_2013)

# check column names
original_col_names <- colnames(dogs)
original_col_names

# rename data frame columns
dogs <- dogs %>%
  rename(avg_height_inches = avg_height,
         avg_weight_lbs = avg_weight,
         popularity_change_13_to_16 = rank_change_13_to_16)

# check column names
new_col_names <- colnames(dogs)
new_col_names