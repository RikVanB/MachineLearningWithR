setwd("C:/Users/Rik Van Belle/OneDrive - Erasmushogeschool Brussel/3e Bachelor Dig-X NS/Trends & Talents/DataScienceR")

install.packages("ff")
library(ff)
irisff <- read.table.ffdf(
  file = "data/Iris.csv",
  FUN = "read.csv")
class(irisff)
names(irisff)
irisff[1:5,]
install.packages("biglm")
library(biglm)

model <- biglm(
  formula = Petal.Width ~ Petal.Length,
  data = irisff
)

summary(model)

plot(
  x = irisff$Petal.Length[],
  y = irisff$Petal.Width[],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length",
  ylab = "Petal Width")

b <- summary(model)$mat[1,1]
m <- summary(model)$mat[2,1]

lines(
  x = irisff$Petal.Length[],
  y = m * irisff$Petal.Length[] + b,
  col = "red",
  lwd = 3)

predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2,5,7),
    Petal.Width = c(0,0,0)
  )
)
