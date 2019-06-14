# 2. Objects in R ----

rm(list = ls())

# 2.1 Vector ----
# - Objects of same type
# - Create with `c`
# - Helper functions: `:`, `seq`, `seq_along`, `seq_len`, `rep`
# - Type coercion
# - Vectorization
# - Vector Recycling

x <- c(1, 2, 3)
class(x)

y <- c("a", "b", "c")
class(y)

z <- c("1", "2", "3")
class(z)

1:10
-10:-1

1:10:0.1 # does NOT work in R (python style)
seq(1, 10, by = 0.1)
seq(1, 10, length.out = 21)

# EXERCISE: What does the following code do? Think first, try later
c(1, "a", "b") # automatic type coercion
1:3 * 5        # vector recycling
1:6 * 1:2
1:50 * c(0, 1)
1:50 * c(-1, 1)
(1:10) ^ 2
1:20 ^ 2
c(1, 2, c(3, 4, 5))
rep(1, 4)
rep("a", 4)
rep(c(1, 2), 4)
rep(c(1, 2), each = 4)
seq(0, 1, length.out = 5)
seq_along(c(4, 7, 10))
seq_len(10)
1:10
seq_len(0)
# 0:0

as.numeric(c("1", "2", "c"))
as.character(1:10)

c("a", "b", "c", "d")
seq_along(c("a", "b", "c", "d"))

a <- rep(1:4, each = 4)
class(a)


# 2.2 Factor ----
# - Like categorical variables
# - Internally: Integer
# - Used for boxplot, regressions etc.

f <- factor(c("blue", "blue", "red", "red", "green"))
f[1] <- "purple"

levels(f) <- c("blue", "red", "green", "purple")
f
f[1] <- "purple"

f

x <- c("a", "a", "b", "b", "c", "c")
xfac <- factor(x)
y <- rnorm(6)

plot(y ~ x)
plot(y ~ xfac)

lm(y ~ xfac)

numfac <- factor(c("5", "2", "1", "1", "2", "5"))
as.numeric(numfac)
as.character(numfac)
as.numeric(as.character(numfac))

# 2.3 List ----
# - Can contain elements of different types
# - List elements can have names

lista <- list(
  name = c("Asterix", "Obelix"),
  village = "Small village",
  age = c(30, 32)
)

listb <- list(
  "Something",
  "something else",
  list(1, 2, 3)
)
listb


# 2.4. Matrix ----
# - Matrix is constructed by filling a 2-dimensional frame
#   with elements from a vector

m <- matrix(1:6, 2, 3)
m

m2 <- matrix(1:6, 2, 3, byrow = TRUE)
m2

dim(m)

m3 <- 1:6
dim(m3) <- c(2, 3)
m3
class(m3)

# EXERCISE: What matrices are constructed here? Think first, try later
m1 <- matrix(c(3, 2, 4, 3), 2)
m2 <- matrix(1, 2, 3)
m3 <- matrix(1:15, ncol = 5)
m4 <- matrix(1:9, 3, 3, byrow = TRUE)

matrix(1:8, 3, 3)

m0 <- matrix(NA, 3, 3)
m0[1, 1] <- 1

m5 <- diag(c(1, 2, 3))

m6 <- diag(6)

# - Elementwise vs. matrix operations

m1
m1 + m1
m1 * m1
m1 / m1

# matrix operations
m1 %*% m1
m1 %*% m2

m2
t(m2)

m1
solve(m1)
m1 %*% solve(m1)

m1 * m2
m2 %*% m1

eigen(m1)
chol(diag(1:2))

# 2.5. data.frame ----
# - Can created by hand
# - More often: Read in from file

d <- data.frame(
  a = 1:3,
  b = c("a", "b", "c"),
  c = rnorm(3)
)
d

setwd("~/r-basics")
getwd()

zoo <- read.csv("zoo.csv", stringsAsFactors = FALSE)
read.csv2("zoo.csv")
?read.table
?readLines
zooLines <- readLines("zoo.csv")

str(zoo)

# [data.frame, read in file]

# 2.6. Functions
# - Ordinary objects (R is a functional language)
# - Object `mean` vs function call `mean()`

mean # function as object
mean(1:3) # function call

getwd
getwd()

# 2.7 EXERCISES ----
# 2.7.1 Vectors ----
#
# Create the following vectors with R. Use the functions c, ":", seq
# and rep:
#
# [2, 3, 5, 7, 11]
# [cinnamon, parsley, thyme, coriander]
# [1, 2, ... , 100]
# [5, 4, ... , -5]
# [0, 0.1, 0.2, 0.3, ... , 1]
# [0, 1, 0, 1, 0, 1, 0, 1]
# [0, 0, 0, 1, 1, 1, 2, 2, 2]
c(2, 3, 5, 7, 11)
c("cinnamon", "parsley", "thyme", "coriander")
1:100
seq(1, 100)
5:-5
seq(5, -5)
seq(0, 1, by = 0.1)
seq(0, 1, length.out = 11)
rep(c(0, 1), 4)
rep(0:2, each = 3)

# 2.7.2 Matrices ----
#
# Create the following matrices with R. Use functions matrix and diag
#
# matrix A:
# [1 1 1]
# [1 1 1]
#
# matrix B:
# [1 1 1 1]
# [2 2 2 2]
# [3 3 3 3]
#
# matrix C:
# [1 2 3 4]
# [1 2 3 4]
# [1 2 3 4]
#
# matrix D:
# [5 0 0]
# [0 5 0]
# [0 0 5]
matrix(1, 2, 3)
matrix(rep(1, 6), 2, 3)
matrix(1:3, 3, 4)
matrix(1:4, 3, 4, byrow = TRUE)
matrix(rep(1:4, each = 3), 3, 4)
diag(3) * 5
diag(rep(5, 3))


# 2.7.3 Data frames ----
#
# Load csv-file zoo.csv into R. Set working directory with setwd or
# via the RStudio menu (Session - Set Working Directory - ... ) to the
# directory containing zoo.csv. Load the csv file into the
# variable dat. Inspect dat with the functions str, print, names and
# View

library(readr)
zoo <- read_csv("r-basics/zoo.csv")
class(zoo)

# 2.7.4 Functions ----
#
# Functions are ordinary objects in R.
getwd       # returns the function as object
getwd()     # calls the function

# Get the structure of function dnorm (density of normal
# distribution)
str(dnorm)

# calculate density at x = 0 for density with mean 4 and sd 3
dnorm(0, 4, 3)

# change order of parameters
dnorm(sd = 3, mean = 4, x = 0)

# leave out parameters (sd is set to default value = 0)
dnorm(0, 4)

# parameters without default (x) must be specified
dnorm(mean = 4, sd = 3)
