require("readr")
require("dplyr")

# load data frame
artists <- read_csv("Customer.csv")

# inspect data frame using piping command (which works like composition)
artists %>% head()