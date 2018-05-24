if(!require("tidyverse")) install.packages("tidyverse", dependencies = TRUE); library("tidyverse")
if(!require("xts")) install.packages("xts", dependencies = TRUE); library("xts")
if(!require("zoo")) install.packages("zoo", dependencies = TRUE); library("zoo")
if(!require("chron")) install.packages("chron", dependencies = TRUE); library("chron")
if(!require("forecast")) install.packages("forecast", dependencies = TRUE); library("forecast")


setwd("C:/Users/Felix/Desktop/Uni/Berlin/2. Semester/SPL")



a <- read_csv("Robbery_2014_to_2017.csv")
b <- read_csv("2016_neighbourhood_profiles.csv")

d <- c()
c <- a %>% separate(Neighbourhood, "Neighbourhood", sep = "\\(", remove = TRUE, convert = FALSE)

df1 <- b %>%
  select(-`Data Source`) %>%
  gather(Neighbourhood, Value, -Characteristic, -Category, -Topic)

##funktioniert bis hier 

df2 <- df1 %>%
  group_by(Characteristic) %>%
  mutate(id = 1:n()) %>%
  spread(Characteristic, Value)

         