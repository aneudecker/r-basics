# 7. Data management with dplyr ----

library(dplyr)
# install.packages("dplyr")

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
# You always get a dataset (data.frame) back 

library(readr)
data <- read_csv("data/affairs.csv")

# 7.2 Selection of *Rows*
# - filter, slice, sample_n, sample_frac
# - Make changes permanent by assigning to (new) variable
slice(data, 1)
slice(data, 1:10)
slice(data, c(2, 4))

data[1, ]

filter(data, sex == "male")
data[data$sex == "male", ] # same in base R

filter(data, sex == "male", nbaffairs > 0, occupation == 7)
data[data$sex == "male" & data$nbaffairs > 0 & data$nbaffairs == 7, ]

sample_n(data, 10)
sample_frac(data, 0.01)

dataMale <- filter(data, sex == "male")

# 7.3 Selection of *Columns*
# - select (rename, distinct)
# - starts_with, ends_with, matches, contains
# - pull

select(data, occupation)
select(data, occupation, sex)
data[, c("occupation", "sex")]

select(data, starts_with("child"))
data[, grepl("^child", names(data))] # in base R

select(data, ends_with("s"))
select(data, contains("a"))

dataSexChild <- select(data, sex, child)
distinct(dataSexChild)

rename(data, "has child" = "child", "rating" = "rate")

# 7.4 Arrange
# - arrange (desc)

arrange(data, sex)
arrange(data, desc(sex))

arrange(data, sex, child)

# 7.5 Adding new columns
# - mutate, transmute

dataNew <- mutate(data, monthMarried = ym * 12)
select(dataNew, ym, monthMarried)

transmute(data, monthMarried = ym * 12, ym = ym)

# 7.6 Summarise
# - summarise

summarise(data, mean(ym))
summarise(data, mean(ym), sd(ym))
summarise(data, mean = mean(ym), sd = sd(ym))

# 7.7 Chaining
# - Works with all R functions
# - One command one line

mean(rnorm(100))

# create Ctrl + Shift + M
rnorm(100) %>% 
  mean

100 %>% 
  rnorm %>% 
  mean

100 %>%
  rnorm(mean = 100, sd = 15) %>% 
  mean

# Select the mean number of affairs of the first 10 rows in the dataset
data %>%
  slice(1:10) %>% 
  summarise(mean = mean(nbaffairs))

data %>%
  arrange(desc(nbaffairs)) %>% 
  slice(1:10) %>% 
  summarise(mean = mean(nbaffairs))

# EXERCISE
# - Select only column occupation
select(data, occupation)
data %>%
  select(occupation)

# as vector
pull(data, occupation)
data %>%
  pull(occupation)

# - Calculate mean number of affairs
summarise(data, mean = mean(nbaffairs)) %>%
  pull(mean)

# - Calculate mean number of affairs for all people with a child # pipe it!
filter(data, child == "yes") %>% 
  summarise(mean = mean(nbaffairs))

data %>%
  arrange(rate) %>% 
  filter(sex == "male") %>% 
  filter(child == "yes") %>% 
  summarise(mean = mean(nbaffairs))
  
# - Calculate mean number of affairs for all males with a child
data %>%
  filter(sex == "male", child == "yes") %>% 
  summarise(mean = mean(nbaffairs))

data %>%
  filter(sex == "male") %>% 
  filter(child == "yes") %>% 
  summarise(mean = mean(nbaffairs))

# - Select the row of the person with the most number of affairs
data %>%
  filter(sex == "male") %>% 
  arrange(desc(nbaffairs)) %>% 
  slice(1)

# - Select all rows where the number of years married is greater than 10
data %>%
  filter(ym > 10) %>%
  select(education) %>%
  summarise(mean(education))

# 7.8 Grouping
# - the cool stuff
data %>%
  group_by(sex) %>% 
  summarise(mean = mean(nbaffairs))

data %>%
  group_by(sex) %>%
  arrange(desc(ym)) %>%
  slice(1)

data %>%
  group_by(sex) %>%
  mutate(nbaffairsStd = (nbaffairs - mean(nbaffairs))/sd(nbaffairs))

# EXERCISE
# - Calculate mean number of affairs depending on
#   - sex
#   - age > 50
data %>%
  group_by(age > 50) %>%
  summarise(mean(nbaffairs))
#   - occupation
data %>%
  group_by(occupation) %>%
  summarise(mean(nbaffairs)) %>%
  ungroup

#   - sex and child
data %>%
  group_by(sex) %>%
  group_by(child) %>%
  summarise(mean(nbaffairs))

data %>%
  group_by(sex, child, rate) %>%
  summarise(mean(nbaffairs))

#   - rating of marriage (rate)
# - Select the male and female with most affairs at once (you should get a dataset with 2 rows)
data %>%
  group_by(sex) %>%
  arrange(desc(nbaffairs)) %>% 
  slice(1)
# - Calculate mean, median, sd, min and max number of affairs depending on sex
data %>%
  group_by(sex) %>%
  summarise(
    mean(nbaffairs),
    median(nbaffairs),
    sd(nbaffairs),
    min(nbaffairs),
    max(nbaffairs)
  )

# 7.9 join
data %>% select(occupation)

library(readxl)
mapping <- read_excel("data/ref_occupation.xlsx")

dataMapped <- inner_join(data, mapping, by = c("occupation" = "occupation_code"))

left_join 
right_join
full_join

# EXERCISE
# - Use your own datasets or one  from 04-descriptive.R
