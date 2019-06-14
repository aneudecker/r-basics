# 4. Descriptive statistics ----

# 4.1 Random numbers
# - rnorm(n, mean, sd)
# - rchisq(n, df)
# - rexp(n, rate)
x <- rnorm(100, mean = 5, sd = 10)
hist(x)

y <- rchisq(1000, df = 10)
hist(y)

z <- rexp(1000, rate = 1/10)
hist(z)

a <- sample(c("a", "b", "c"), 1000, replace = TRUE)
barplot(table(a))

b <- sample(c("a", "b", "c"), 1000, replace = TRUE, prob = c(0.1, 0.5, 0.4))
barplot(table(b))

# 4.2 Univariate statistics
# - Functions for vectors (variables of data.frame)
# - length, table, sum, mean, median, variance, sd, quantile, min, max

length(x) # Length of vector = number of elements
table(a)  # Frequency table
sum(x)
mean(x)
median(x)
var(x)
sd(x)
min(x)
max(x)

## missing values
y[500] <- NA
y

sum(y)
sum(y, na.rm = TRUE)

# sum(data$var)

quantile(x, probs = c(0.33, 0.67))

# 4.3. Multivariate statistics
# - Two vectors (two variables of data.frame)
# - cor, cov, table, lm

y <- rchisq(1000, df = 10)

cor(y, z)
cov(y, z)

table(a, b)

plot(y, z)
lm(z ~ y)

abline(coef(lm(z ~ y)), lwd = 2, col = "red")

# 4.4 Formulas
# - Special concise type of model specification
# - For regressions, tests etc.

# Simple linear regression: y ~ x
# Multiple lineare regression: y ~ x + z + a
# With interactions: y ~ x * z 

t.test(y, z)
wilcox.test(y, z)

# EXERCISE: Analyse your data!
# - Load it
# - Inspect it
# - Analyse it

# Example data sets:
# Google Trends [try r and python]
# https://trends.google.com/trends/explore?q=%2Fm%2F03p1r4&date=all
#
# Bike overtaking data
# http://drianwalker.com/overtaking/PsychBikeData.xls
#
# Gov Data
# https://www.govdata.de
