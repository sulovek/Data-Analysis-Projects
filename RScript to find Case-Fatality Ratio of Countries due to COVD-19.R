# Coronadata setup

library(ggplot2)
library(dplyr)
library(lubridate)
library(ggthemes)

# Import
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")

# Clean and sort
data$dateRep = dmy(data$dateRep)
data = arrange(data, dateRep)
data = rename(data, country = countriesAndTerritories)


# Case Fatality 
country = data %>% 
  select(dateRep, cases, deaths, country, popData2019) %>%
  group_by(country)  %>% 
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  arrange(country)

deaths = data %>% 
  select(dateRep, cases, deaths, country, popData2019) %>%
  group_by(country)  %>% 
  summarize(deaths = sum(deaths, na.rm = TRUE)) %>%
  arrange(country)

population = data %>% 
  select(dateRep, cases, deaths, country, popData2019) %>%
  group_by(country)  %>% 
  summarize(popn = mean(popData2019, na.rm = TRUE)) %>%
  arrange(country)

# Combine
country$deaths = deaths$deaths
country$population = population$popn
country$casefatality = country$cases/country$deaths

# Ordering on the basis of casefatality
country = arrange(country, -casefatality)
 
# Removing the rows with infinite values
is.na(country) <- do.call(cbind,lapply(country, is.infinite))
country = na.omit(country)

# Plot 1
ggplot(head(country), n = 10)+
  aes(reorder(country, casefatality), casefatality)+
  geom_bar(stat = "identity", width = 0.5)+
  theme_fivethirtyeight()+
  coord_flip()+
  labs(title = "Countries with highest Cases/Deaths value (lwo casefatality)", subtitle = "Dr. Sulove Koirala", caption = today())

# Plot 2
ggplot(tail(country), n = 10)+
  aes(reorder(country, casefatality), casefatality)+
  geom_bar(stat = "identity", width = 0.5)+
  theme_fivethirtyeight()+
  coord_flip()+
  labs(title = "Countries with low Cases/Deaths value (high casefatality)", subtitle = "Dr. Sulove Koirala", caption = today())
