# Predicting with Machine Learning

data(iris)

#Set a seed to make randomness reproducable
set.seed(42)

# Randomly sample 100 of 150 row indexes
indexes <- sample(
  x = 1:150,
  size = 100)

print(indexes)

# Create a training set from remaining indexes
train <- iris[indexes, ]

# Create a test set from remaining indexes
# - will take the indexes that are NOT listed in indexes
test<- iris [-indexes,]

install.packages('tree')
library(tree)

model <- tree(
  formula = Species ~ Petal.Length + Petal.Width,
  data = train
)

summary(model)

plot(model)
text(model)

library(RColorBrewer)

palette <- brewer.pal(3, "Set2")
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  pch = 19,
  col = palette[as.numeric(iris$Species)],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)

partition.tree(
  tree = model,
  add = TRUE)

predictoins <- predict(
  object = model,
  newdata = test,
  type = "class"
)

table(
  x = predictoins,
  y = test$Species)

install.packages("caret")


library(caret)
confusionMatrix(
  data = predictoins,
  reference = test$Species
)

save(model, file = "Tree.RData")
