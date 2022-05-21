require("readr")
require("dplyr")

# load data frame
artists <- read_csv("Customer.csv")

# inspect data frame
artists

# outputs first 7 rows
head(artists, 7)

# provide  summary statistics such as mean, median, minimum and maximum for each numeric column while providing class and length information for non-numeric columns.
summary(artists)