# STEP 1: LOADING THE DATA FRAME
# loading essential R-packages
require("readr")
require("dplyr")

# reading our data frame
data <- read_csv("C:/Users/abdul/Desktop/UDEMY Courses/Python And R Course/Sections/Classificaation models -- Data preparation/House-Price.csv")



# STEP 2: PERFORMING EDD ANALYSIS (FINDING VARIABLES WITH OUTLIERS AND NON-USABLE QUALTATIVE VARIABLES)
# (NOTE: OUTLIERS ONLY EXIST FOR QUANTATIVE VALUES)

# getting EDD analysis of the data frame
summary(data)

# finding outliers using boxplots
outlierIdentifier <- boxplot(data$n_hot_rooms)

# identifying non-useable qualtattive variables using barplots
uselessQualatativeVariable <- barplot(table(data$bus_ter)[order(-table(data$bus_ter))], horiz = FALSE, main = "Useless Qualtative variables", col = c("red", "violet"))



# STEP 3: REMOVING OUTLIERS FROM VARIABLES BASED ON THE "CAPPING AND FLOORING APPROACH"
upperLimit <- quantile(data$n_hot_rooms, 0.99)
file$n_hot_rooms[file$n_hot_rooms > 3*upperLimit] <- 3*upperLimit

lowerLimit <- quantile(data$rainfall, 0.01)
file$rainfall[file$rainfall < 0.3*lowerLimit] <- 0.3*lowerLimit 



# STEP 4: FILLING IN MISSING VALUES BASED ON METHOD 2 (REPLACING WITH MEAN/MEDIAN/MODE)

mean(data$n_hos_beds) # this will give error becayse there are missing values
mean(data$n_hos_beds, na.rm = TRUE) # this will include mean excluding missing observations

#following syntax identifies nth-obervaation with missing value of specified indepdedent variable
which(is.na(data$n_hos_beds))

# the syntax that actually fills in missing velaues based on mean that ignores missing values
data$n_hos_beds[is.na(data$n_hos_beds)] <- mean(data$n_hos_beds, na.rm = TRUE)
which(is.na(data$n_hos_beds))



# STEP 5: VARIABLE TRANSFORMATION TO ENABLE LINEAR REGRESSION

# here, we are using the first method (taking the mean of similar variables, storing it into new variable, and then deleting old variables)
data <- data %>% mutate(avg_dis = mean(c(data$dist1, data$dist2, data$dist3, data$dist4))) %>% select(-dist1, -dist2, -dist3, -dist4)

summary(data)
View(data)


# STEP 6: CREATING DUMMY VARIABLES TO REPRESENT QUALATATIVE VARIABLES SO THAT LINEAR REGRESSION CAN OCCUR

install.packages("dummies")
library(dummies)
require("dummies")

data <- dummy.data.frame(data)
View(data)

# to avoid "full negative correlation", we need to represent one of the dummy columns representing a catagorial variable
data <- data %>% select(-airport_NO, -waterbody_None)



# STEP 7: CREATING THE LOGISTIC REGRESSION WITH SINGLE INDEPENDENT VARIABLE
      # Note: first argument order is dependent variable and then independeny variable
      # Note: the third argument is needed to specify logistic regression
glm.fit <- glm(Sold~price, data = data, family = binomial)
summary(glm.fit)


# STEP 8: CREATING THE LOGISTIC REGRESSION WITH MULTIPLE INDEPENDENT VARIABLES
# Note: first argument order is dependent variable and then independeny variable
# Note: the third argument is needed to specify logistic regression
glm.fit <- glm(Sold~ . , data = data, family = binomial)



# STEP 9: CREATING OUR CONFUSION MATRIX AND ANALYZING PERFORMANCE
glm.probs <- predict(glm.fit, type = "response")

# predicting dependent values for multivariable regression
glm.pred <- rep("No", 506)
# if the probability of "True" class being assigned is greater than 0.5, than that class will be assigned  
glm.pred[glm.probs > 0.5] <- "YES"

# actuly creating the confusion matrix
table(glm.pred, data$Sold)




