# 8. Graphics with ggplot ----

# - layered grammar of graphics
# - www.ggplot2.org

library(ggplot2)
# install.packages("ggplot2")

# - *data* und *aesthetic mappings* (Mapping of variable to graphical property)
# - *geoms* (geometric objects)
# - *stats* (statistical transformations)
# - *scales* (map variable values into the aesthetic space)
# - *coord* (coord systems)
# - *facet* (devide graphic up into parts)
# - *theme*
# - *layout*

library(readr)
affairs <- read_csv("data/affairs.csv")

# 8.1 barplot
# Example 1: rating of marriage
# - geom_bar
# - aes(x, fill)
# - xlab, ylab
# - ggtitle
ggplot(affairs, aes(x = rate, group = sex, fill = sex)) +
  geom_bar() +
  xlab("Rating of marriage") +
  ylab("Count") +
  ggtitle("My first barplot")

# Example 2: child
# - scale_fill_manual(values = c("yes" = "..", "no" = ".."))
ggplot(affairs, aes(x = rate, group = sex, fill = sex)) +
  geom_bar() +
  scale_fill_manual(values = c("male" = "#FA7725", "female" = "#358430"))

ggplot(affairs, aes(x = rate, group = sex, fill = sex)) +
  geom_bar() +
  scale_fill_grey()

ggplot(affairs, aes(x = rate, group = sex, fill = sex)) +
  geom_bar() +
  scale_fill_brewer(palette = 5)
#     RRGGBB  - biggest: FF -> 255, 00 -> 0

# Example 3: grouped
# - group, fill
# - position = "dodge"
ggplot(affairs, aes(x = rate, group = sex, fill = sex)) +
  geom_bar(position = "dodge") +
  xlab("Rating of marriage") +
  ylab("Count") +
  ggtitle("My first barplot")

# 8.2 lineplot
library(readr)
lang <- read_csv(
  "data/lang.csv",
  col_names = c("Month", "R", "Python", "Matlab"), 
  col_types = cols(Month = col_date(format = "%Y-%m")), 
  skip = 3)

# - geom_line
# - fixed aesthetic col
# - geom_rug sided = "b"
ggplot(lang, aes(x = Month, y = R)) +
  geom_line(color = "red") +
  geom_line(mapping = aes(y = Python), color = "green") +
  geom_line(mapping = aes(y = Matlab), color = "blue")
  
# 8.3 boxplot
ggplot(affairs, aes(x = as.factor(rate), y = nbaffairs)) +
  geom_boxplot()

ggplot(affairs, aes(x = child, y = rate)) +
  geom_boxplot()

# 8.4 histogram
ggplot(affairs, aes(x = nbaffairs)) +
  geom_histogram()

ggplot(lang, aes(x = R)) +
  geom_histogram(fill = "red", alpha = 0.5, binwidth = 2) +
  geom_histogram(aes(x = Python), fill = "blue", alpha = 0.5, binwidth = 2) + 
  geom_histogram(aes(x = Matlab), fill = "green", alpha = 0.5, binwidth = 2)

pdf("myhistogram.pdf")
ggplot(lang, aes(x = R)) +
  geom_histogram(fill = "red", alpha = 0.5, binwidth = 2) +
  geom_histogram(aes(x = Python), fill = "blue", alpha = 0.5, binwidth = 2) + 
  geom_histogram(aes(x = Matlab), fill = "green", alpha = 0.5, binwidth = 2)
dev.off()

# 8.5 scatter plot
# - geom_smooth
ggplot(lang, aes(x = R, y = Python)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE)

ggplot(lang, aes(x = R, y = Python)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "purple")

ggplot(lang, aes(x = R, y = Python, color = Matlab)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "purple") +
  scale_color_gradient(low = "green", high = "red")

# 8.6 facets
ggplot(affairs, aes(x = ym)) +
  geom_histogram() +
  facet_grid(. ~ child + sex)

# 8.7 save plot

# EXERCISES
# use affairs dataset
# - draw a histogram of the variable nbaffairs
ggplot(affairs, aes(x = nbaffairs)) +
  geom_histogram()

ggplot(affairs) +
  geom_histogram(aes(x = nbaffairs))
# - draw a grouped histogram for nbaffairs grouping on sex
ggplot(affairs, aes(x = nbaffairs, group = sex, fill = sex)) +
  geom_histogram(position = "dodge")
#   - change the colors for the groups

ggplot(affairs, aes(x = nbaffairs, group = sex, fill = sex)) +
  geom_histogram() +
  scale_fill_manual(values = c("female" = "green", "male" = "purple"))

# - draw boxplots for nbaffairs with rate on x axis
ggplot(affairs) +
  geom_boxplot(aes(x = factor(rate), y = nbaffairs, color = factor(rate),
                   fill = rate)) +
  scale_fill_gradient(low = "green", high = "red")

# - make 4 plots with histograms of rating of marriage splitting up for sex and variable child
ggplot(affairs) +
  geom_histogram(aes(x = rate)) +
  facet_grid(sex ~ child)
# - make a plot of age and nbaffairs and draw a smoothing line
ggplot(affairs, aes(x = age, y = nbaffairs)) +
  geom_point() +
  geom_smooth()
# - export plot as png and pdf

# tidy data
install.packages("tidyr")
library(tidyr)

dataLong <- gather(lang, key = lang, value = count, R:Matlab)
dataWide <- spread(dataLong, key = lang, value = count)

ggplot(dataLong, aes(x = Month, y = count, group = lang, color = lang)) +
  geom_line()

# EXERCISES
# - use your own data or data from 04-descriptive
# - have a look at http://www.cookbook-r.com/Graphs/ and recreate a plot of your choice
