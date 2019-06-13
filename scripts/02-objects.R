# 2. Objects in R ----

# 2.1 Vector ----
# - Objects of same type
# - Create with `c`
# - Helper functions: `,`, `seq`, `seq_along`, `seq_len`, `rep`
# - Type coercion
# - Vectorization
# - Vector Recycling

# EXERCISE: What does the following code do? Think first, try later
# c(1, "a", "b")
# 1:3 * 5
# (1:10) ^ 2
# c(1, 2, c(3, 4, 5))
# rep(1, 4)
# rep(c(1, 2), 4)
# rep(c(1, 2), each = 4)
# seq(0, 1, length.out = 5)
# seq_along(c(4, 7, 10))

# 2.2 Factor ----
# - Like categorical variables
# - Internally: Integer
# - Used for boxplot, regressions etc.

# [Plot, Regression, Caveat]

# 2.3 List ----
# - Can contain elements of different types
# - List elements can have names

# 2.4. Matrix ----
# - Matrix is constructed by filling a 2-dimensional frame
#   with elements from a vector

# [Create Matrix, dim]

# EXERCISE: What matrices are constructed here? Think first, try later
# m1 <- matrix(c(3, 2, 4, 3), 2)
# m2 <- matrix(1, 2, 3)
# m3 <- matrix(1:15, ncol = 5)
# m4 <- matrix(1:9, 3, 3, byrow = TRUE)
# m5 <- diag(c(1, 2, 3))
# m6 <- diag(6)

# - Elementwise vs. matrix operations

# 2.5. data.frame ----
# - Can created by hand
# - More often: Read in from file

# [data.frame, read in file]

# 2.6. Functions
# - Ordinary objects (R is a functional language)
# - Object `mean` vs function call `mean()`

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


# 2.7.3 Data frames ----
#
# Load csv-file zoo.csv into R. Set working directory with setwd or
# via the RStudio menu (Session - Set Working Directory - ... ) to the
# directory containing zoo.csv. Load the csv file into the
# variable dat. Inspect dat with the functions str, print, names and
# View

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
