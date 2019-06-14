# 3 Indexing ----
# - Get parts of a larger object
# - Element of Vector / List
# - Variable of data.frame

# 3.1 `[]`
x <- letters[1:10]
x[1]
x[2]
x[c(1, 10)]
x[c(1, 1, 2, 3, 3, 1)]
x[4:8]

l <- list(
  a = c("Schiller", "Geothe"),
  loc = "Weimar",
  books = list(
    "booka",
    "bookb"
  )
)

l[1:2]
l[c("loc", "books")]
l["a"] # still a list!
class(l["a"])

# 3.2 `$`
l["a"]
class(l["a"])
l$a
class(l$a)

# 3.3 `[[]]`
l$a
l[["a"]]

# why do I need [[]]
name <- "a"
l$name
l[[name]]

# 3.4 `[,]`
m <- matrix(letters[1:6], 2, 3)
m

m[1, 2]
m[1:2, 3]
m[-1, 3]
m[1:2, -c(1,2)]
m[1,]
m[,2]
m[,]

class(m[1,])
m[1,,drop = FALSE]

# 3.5 Logical Vector
x <- rnorm(10)
x > 0
x[x > 0]
x > 0 & x < 1  # logical OR  : &
x < 0 | x > 1  # logical AND : |
x[x < 0 | x > 1]

# 3.6 Example: zoo.csv
library(readr)
zoo <- read_csv("r-basics/zoo.csv")

zoo
zoo$class
zoo[["class"]]
zoo[, "class"] # still a tibble (if it has been a tibble). Tidyverse logic

names(zoo)
zoo$animal[zoo$class == "Fish"]
# Animal names for birds or bugs?
zoo$animal[zoo$class == "Bug" | zoo$class == "Bird"]
zoo$animal[zoo$class == "Bug" | "Bird"] # doesnt work
zoo$animal[zoo$class %in% c("Bug", "Bird")]

## First 10 rows of the dataset (all columns)
zoo[1:10,]

zoo$animal[zoo$class == "Fish" & zoo$milk == 1]

zoo$animal[zoo$class == "Invertebrate"]

# Give me the dataset containing only Invertebrates
zoo[zoo$class == "Invertebrate",]

# EXERCISES:
# 1. Give me all the animal names from animals with feathers
zoo$animal[zoo$feathers == 1]
# 2. Are there any animals in the dataset which have both feathers an give milk
zoo$animal[zoo$feathers == 1 & zoo$milk == 1]
# 3. select the columns "animal", "breathes", "legs" for all Mammals at once
zoo[zoo$class == "Mammal", c("animal", "breathes", "legs")]
# 4. Are there any domestic fish?
zoo$animal[zoo$class == "Fish" & zoo$domestic == 1]
# 5. Give me all the animals with feathers which are no Birds (Unequal Operator !=)
zoo$animal[zoo$feathers == 1 & zoo$class != "Bird"]

# Advanced:
# 6. How many of the animals in the dataset have feathers?
sum(zoo$feathers)
# 7. Give me a frequeny table of the class variable (Function table)
table(zoo$class)
# 8. Whats the average number of legs of Invertebrates?
mean(zoo$legs) # for all animals
mean(zoo$legs[zoo$class == "Invertebrate"])
