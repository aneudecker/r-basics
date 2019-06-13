setwd("~/Courses/r-workshop/data")

n <- 100
timePoints <- 20

weightMin <- 50
weightMax <- 100

deprMin <- 2
deprMax <- 13

ageMin <- 20
ageMax <- 60

d <- data.frame(
    age = round(runif(n, ageMin, ageMax)),
    sex = sample(c("m", "f"), n, replace = T)
)

meanWeight <- runif(n, weightMin, weightMax)
meanDepr <- round(runif(n, deprMin, deprMax))

weight <- matrix(
    round(rnorm(n * timePoints, meanWeight, 3),2),
    n,
    timePoints
)

depr <- matrix(
    round(rnorm(n * timePoints, meanDepr, 2),1),
    n,
    timePoints
)

dfull <- cbind(d, weight, depr)
names(dfull)[3:(3 + timePoints - 1)] <- paste("weight", 1:timePoints, sep = "_")
names(dfull)[(3 + timePoints):(3 + timePoints + timePoints - 1)] <- paste("depression", 1:timePoints, sep = "_")

write.csv(dfull, "depression.csv")
