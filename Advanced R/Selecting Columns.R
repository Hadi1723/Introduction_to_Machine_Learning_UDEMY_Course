require("readr")
require("dplyr")

# load data frame
artists <- read_csv("Customer.csv")

# selecting a column from a table
select(artists, Age)

# This is how we can view a frequency table
View(table(artists$Age))
