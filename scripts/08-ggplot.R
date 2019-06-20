# 8. Graphics with ggplot ----

# - layered grammar of graphics
# - www.ggplot2.org

library(ggplot2)

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

# Example 2: child
# - scale_fill_manual(values = c("yes" = "..", "no" = ".."))

# Example 3: grouped
# - group, fill
# - position = "dodge"


# 8.2 lineplot
lang <- read_csv(
  "data/lang.csv",
  skip = 3,
  col_types = cols(Month = col_date(format = "%Y-%m")),
  col_names = c("Month", "R", "Python", "Matlab")
)

# - geom_line
# - fixed aesthetic col
# - geom_rug sided = "b"

# 8.3 boxplot

# 8.4 historgram

# 8.5 scatter plot
# - geom_smooth

# 8.6 facets

# 8.7 save plot

# EXERCISES
# use affairs dataset
# - draw a histogram of the variable nbaffairs
# - draw a grouped histogram for nbaffairs grouping on sex
#   - change the colors for the groups
# - draw boxplots for nbaffairs with rate on x axis
# - make 4 plots with histograms of rating of marriage splitting up for sex and variable child
# - make a plot of age and nbaffairs and draw a smoothing line
# - export plot as png and pdf


# EXERCISES
# - use your own data or data from 04-descriptive
# - have a look at http://www.cookbook-r.com/Graphs/ and recreate a plot of your choice
