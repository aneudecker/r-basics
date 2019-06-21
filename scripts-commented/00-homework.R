#' -------------------------------------------------------------------
#' 00-homework.R
#'
#' author: Andreas Neudecker
#' e-mail: andreas.neudecker@inwt-statistics.de
#' -------------------------------------------------------------------


# Load data frame ----------------------------------------------------
# load data frame affairs.csv with read.csv into R. Inspect the
# dataset. The variable ym is the number of years the person is
# married and the variable nbaffairs counts the number of affairs in
# the last year.
# where am I?
getwd()
affairs <- read.csv("data/affairs.csv")
str(affairs)
summary(affairs)
hist(affairs$age)

library(readr)
affairs <- read_csv("data/affairs.csv")
str(affairs)

# Descriptive Statistics ---------------------------------------------
# - Calculate the mean number of affairs in the dataset
# - Calculate the correlation between rate (rating of marriage) and
#   nbaffairs
# - Build a frequency table of the variable nbaffairs
# - Think of other statistics that might be of interest in this
#   dataset

mean(affairs$nbaffairs)
median(affairs$nbaffairs)
hist(affairs$nbaffairs)
barplot(table(affairs$nbaffairs))

cor(affairs$rate, affairs$nbaffairs)
cor(affairs$rate, affairs$nbaffairs, method = "spearman")

table(affairs$nbaffairs)

table(affairs$child, affairs$nbaffairs)
prop.table(table(affairs$child, affairs$nbaffairs), margin = 1)

# Select subsets
# - Select the first 10 rows in the dataset
# - Select the variable education in row 400
# - Select all rows where nbaffairs is greater than 0
# - Select the variable ocupation for all females with a child

affairs[1:10, ]

affairs[400, "education"]
affairs[400, 6] # dangerous - column index might change
affairs$education[400] # I prefer this one

affairs$nbaffairs > 0
affairs[affairs$nbaffairs > 0, ]
affairs[affairs$nbaffairs > 0 & affairs$sex == "male", ]
affairs[affairs$nbaffairs > 0 & affairs$age > 55, ]
affairs[affairs$nbaffairs > 0 & affairs$age == min(affairs$age), ]

oc1 <- affairs$occupation[affairs$sex == "female" & affairs$child == "yes"]
barplot(table(oc1))

oc2 <- affairs$occupation[affairs$sex == "male" & affairs$child == "no"]
barplot(table(oc2))

# Multiple means (optional) ------------------------------------------
# - Calculate mean affairs for all levels of religousness (1 anti to 5
# very) Use apply or a for-loop.
# - Calculate mean affairs for all levels of rating of marriage (1
#   very unhappy to 5 very happy). Save the results in a new variable
# - Conundrum: Calculate mean affairs for males and females seperately

# Plots --------------------------------------------------------------
# With the following functions you can create simple plots with R. Try
# these functions for the variables in the dataset
# hist(x)           # histogram of variable x.
#                   # If d is your dataset, try hist(d$age)
# plot(x, y)        # Scatter-Plot of variable x vs variable y
# barplot(table(x)) # Barplot for variable x
# boxplot(x)        # Boxplot for variable x

plot(affairs$ym, affairs$nbaffairs)
lm(affairs$nbaffairs ~ affairs$ym)
