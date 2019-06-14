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

# Descriptive Statistics ---------------------------------------------
# - Calculate the mean number of affairs in the dataset
# - Calculate the correlation between rate (rating of marriage) and
#   nbaffairs
# - Build a frequency table of the variable nbaffairs
# - Think of other statistics that might be of interest in this
#   dataset

# Select subsets
# - Select the first 10 rows in the dataset
# - Select the variable education in row 400
# - Select all rows where nbaffairs is greater than 0
# - Select the variable ocupation for all females with a child

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
