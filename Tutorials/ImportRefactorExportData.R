# Set the working directory
setwd("C:/Users/Rik Van Belle/OneDrive - Erasmushogeschool Brussel/3e Bachelor Dig-X NS/Trends & Talents/DataScienceR")
# Read a tab-delimited data file
cars <- read.table(
  file = "Cars.csv",
  header = TRUE,
  sep = ",",
  quote = "\"")
)
# Get The first 6 elements of the table
head(cars)
library(dplyr)

# Create temp table with columns transmission, cylinders and fuel.economy
temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)

head(temp)
View(temp)
#Filter on transmission
temp <- filter(.data = temp, Transmission == "Automatic")
head(temp)

#Create new column consumption (Fuel.Economy * 0.425)
temp <- mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425)
head(temp)

temp <- group_by(
  .data = temp,
  Cylinders)

head(temp)

temp<-summarise(
  .dat = temp,
  Avg.Consumption = mean(Consumption)
)
head(temp)

temp <- arrange(.data = temp, desc(Avg.Consumption))
head(temp)

efficiency <- as.data.frame(temp)
print(efficiency)

efficiency <- cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission == "Automatic") %>%
  mutate(Consumption = Fuel.Economy * 0.425) %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()

print(efficiency)

write.csv(
  x = efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE)
 )