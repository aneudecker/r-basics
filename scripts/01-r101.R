# 1. RStudio ----

# 1.1 Install Instructions ----
# Download R from one of the following sources
# - https://cran.r-project.org/bin/windows/base/
# - https://cran.r-project.org/bin/maxosx/
# - https://cran.r-project.org/bin/linux/
#
# Download RStudio _Desktop_ from here
# - https://www.rstudio.com/products/rstudio/download/

# 1.2 The R Console ----
# - Enter commands after the `>` sign
# - `+` tells you that a command is not finished yet. Abort with `Esc` key
# - R can be used as calculator, statistical tool, graphics generator
#
# EXERCISE
# - Calculate 111 * 111
# - Calculate 2 to the power of 8 (2 ^ 8)
# - What does the command `rnorm(10)` do?
# - What does the command `hist(rnorm(100))` do?
# - What does the commend `table(c("a", "a", "b", "b", "a", "c"))` do?

# 1.3 Variables ----
# - Assign object to a name with <- or ->

# 1.4. Inspect objects ----
# - Use print, summary, str

# 1.5. Workspace ----
# - Get all objects: `ls()`
# - Remove single object `rm(x)`
# - Remove all objects `rm(list = ls())` or brush symbol in the upper right
#   RStudio panel

# 1.6 Get Help ---
# - `?function` Get help for function `function`
# - What's the function name? Try Google: "R calculate mean"

# 1.7 Package Manager ----
# - Install new packages via `install.packages("package")
#   GUI: Tools - Install Packages - Install from Repository
# - Run function from package `package::function()`
# - Load package: library(package)
# - Run function directly: `function()`

# 1.8 Editor ----
# - Open / Create files via menu (File - New File / Open File - R Script)
# - Send line(s) to console with Ctrl + Enter
# - Edit multiple lines by pressing Alt + Mouseaction
# - Comments start with `#`
# - Headlines end with `----` or `####`

