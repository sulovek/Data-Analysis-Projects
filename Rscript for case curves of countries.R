# Introduction 
#We are going to visualize the curves and observe which countries in Asia is doing well in controlling COVID-19. Steep curve indicates that the country is struggling to control the infection. Flat curves indicates the infection is in check. We will use dataset from ECDC. 

# Importing libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(ggthemes)

# Loading the dataset
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")
head(data)

# Cleaning the data

data$dateRep = dmy(data$dateRep)
data = arrange(data, dateRep)
data = rename(data, country = countriesAndTerritories)

# If we notice that the cases are not in cumulative order. Therefore, we will make a separate column that will display cumulative cases of each country. This is needed to construct a continous line.  

df = data %>%
  group_by(country) %>%
  mutate(cumcases = cumsum(cases)) %>%
  select(dateRep, country, cases, deaths, cumcases, continentExp)

# In America

ggplot(filter(df, continentExp == "America"))+
  aes(dateRep, cumcases)+
  geom_line()+
  theme_classic()+
  facet_wrap(~country, scales = "free_y")+
  labs(x = "", y = "", title = "COVID-19 Cases Curve in American Continent", subtitle = "Dr. Sulove Koirala", caption = today())


# In Europe 

ggplot(filter(df, continentExp == "Europe"))+
  aes(dateRep, cumcases)+
  geom_line()+
  theme_classic()+
  facet_wrap(~country, scales = "free_y")+
  labs(x = "", y = "", title = "COVID-19 Cases Curve in Europe", subtitle = "Dr. Sulove Koirala", caption = today())


# In Oceania

ggplot(filter(df, continentExp == "Oceania"))+
  aes(dateRep, cumcases)+
  geom_line()+
  theme_classic()+
  facet_wrap(~country, scales = "free_y")+
  labs(x = "", y = "", title = "COVID-19 Cases Curve in Oceania", subtitle = "Dr. Sulove Koirala", caption = today())


# In Africa

ggplot(filter(df, continentExp == "Africa"))+
  aes(dateRep, cumcases)+
  geom_line()+
  theme_classic()+
  facet_wrap(~country, scales = "free_y")+
  labs(x = "", y = "", title = "COVID-19 Cases Curve in Africa", subtitle = "Dr. Sulove Koirala", caption = today())


# In Asia

ggplot(filter(df, continentExp == "Asia"))+
  aes(dateRep, cumcases)+
  geom_line()+
  theme_classic()+
  facet_wrap(~country, scales = "free_y")+
  labs(x = "", y = "", title = "COVID-19 Cases Curve in Asia", subtitle = "Dr. Sulove Koirala", caption = today() )



# Bibiliography
# Download today's data on the geographic . (2020, June 14). Retrieved June 14, 2020, from https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide
