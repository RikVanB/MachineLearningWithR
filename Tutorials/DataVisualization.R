# Set the working directory
setwd("C:/Users/Rik Van Belle/OneDrive - Erasmushogeschool Brussel/3e Bachelor Dig-X NS/Trends & Talents/DataScienceR")

Cars <- read.csv("Cars.csv")
head(Cars)
install.packages("ggplot2")
library(ggplot2)
ggplot(
  data = Cars,
  aes(x = Transmission)) +
  geom_bar() +
  ggtitle("Count of Cars by Transmission_Type") +
  xlab("Transmission Type") +
  ylab("Count of Cars")
  
ggplot(
  data = Cars,
  aes(x = Fuel.Economy)) +
  geom_histogram(bins = 10) +
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Count of Cars")

ggplot(
  data = Cars,
  aes(x = Fuel.Economy)) +
  geom_density() +
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Density")

ggplot(
  data = Cars,
  aes(
    x = Cylinders,
    y = Fuel.Economy)) +
  geom_point() +
  ggtitle("Fuel Economy by Cylinders") +
  xlab("Number of Cylinders") +
  ylab("Fuel Economy (mpg)")
