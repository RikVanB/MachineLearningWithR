# Set the working directory
setwd("C:/Users/Rik Van Belle/OneDrive - Erasmushogeschool Brussel/3e Bachelor Dig-X NS/Trends & Talents/DataScienceR")
# Read a tab-delimited data file
cars <- read.csv("Cars.csv")
head(cars)
table(cars$Transmission)

#Lowest value of Fuel.Economy
min(cars$Fuel.Economy)
#Highest value of Fuel.Economy
max(cars$Fuel.Economy)
#Gemiddelde of Fuel.Economy
mean(cars$Fuel.Economy)
#Het middenste getal als je alle getallen van laag naar hoog rangschikt
median(cars$Fuel.Economy)

quantile(cars$Fuel.Economy)
sd(cars$Fuel.Economy)
sum(cars$Fuel.Economy)
#Correlatie tussen 2 waardes. Hoe meer cylinders hoe minder verbruik
cor(
  x = cars$Cylinders,
  y = cars$Fuel.Economy
)

summary(cars)