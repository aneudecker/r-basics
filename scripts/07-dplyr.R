# 7. Data management with dplyr ----

library(dplyr)

# Why?
# - Faster to type than base functions
# - Clear code

# 7.1 Structure
#
# Basic functions:
# - arrange
# - filter
# - select
# - mutate
# - summarise
# Grouping: group_by
# First Argument: dataset

library(readr)
data <- read_csv("data/affairs.csv")

# 7.2 Selection of *Rows*
# - filter, slice, sample_n, sample_frac
# - Make changes permanent by assigning to (new) variable

# 7.3 Selection of *Columns*
# - select (rename, distinct)
# - starts_with, ends_with, matches, contains
# - pull

# 7.4 Arrange
# - arrange (desc)

# 7.5 Adding new columns
# - mutate, transmute

# 7.6 Summarise
# - summarise

# 7.7 Chaining
# - Works with all R functions
# - One command one line

# EXERCISE
# - Select only column occupation
# - Calculate mean number of affairs
# - Calculate mean number of affairs for all people with a child
# - Calculate mean number of affairs for all males with a child
# - Select the row of the person with the most number of affairs
# - Select all rows where the number of years married is greater than 10

# 7.8 Grouping
# - the cool stuff

# EXERCISE
# - Calculate mean number of affairs depending on
#   - sex
#   - age > 60
#   - occupation
#   - sex and child
#   - rating of marriage (rate)
# - Select the male and female with most affairs at once (you should get a dataset with 2 rows)
# - Calculate mean, median, sd, min and max number of affairs depending on sex

# EXERCISE
# - Use your own datasets or one  from 04-descriptive.
