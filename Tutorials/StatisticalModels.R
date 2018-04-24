#Simple Linear Regression
# Visueel weergeven hoeveel 2 parameters op elkaar invloed hebben
# y = m * x + b

# Set the working directory
setwd("C:/Users/Rik Van Belle/OneDrive - Erasmushogeschool Brussel/3e Bachelor Dig-X NS/Trends & Talents/DataScienceR")

data(iris)
head(iris)

plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)")

# Create a linear regression model
model <- lm(
  formula = Petal.Width ~ Petal.Length,
  data = iris
)

summary(model)

# Draw a regression line on the plot
lines(x = iris$Petal.Length,
      y = model$fitted,
      col = "red",
      lwd = 3)

cor(
  x = iris$Petal.Length,
  y = iris$Petal.Width
)

predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2,5,7)
  )
)
