setwd("Final Project")
library(dplyr)
library(tidyverse)

# read in cleaned data
averages <- read.csv("averages_raw_edit.csv")

# create subset dataframes to join
rock_subset <- subset(averages, genre == "rock",
                      select = c("year", "mean"))
pop_subset <- subset(averages, genre == "pop",
                     select = c("year", "mean"))
jazz_subset <- subset(averages, genre == "jazz",
                      select = c("year", "mean"))
folk_subset <- subset(averages, genre == "folk",
                      select = c("year", "mean"))
funk_subset <- subset(averages, genre == "funk",
                      select = c("year", "mean"))
classical_subset <- subset(averages, genre == "classical",
                           select = c("year", "mean"))
electronic_subset <- subset(averages, genre == "electronic",
                            select = c("year", "mean"))
hip_hop_subset <- subset(averages, genre == "hip hop",
                         select = c("year", "mean"))

# rename columns
rock_subset <- rename(rock_subset, rock = mean)
pop_subset <- rename(pop_subset, pop = mean)
funk_subset <- rename(funk_subset, funk = mean)
jazz_subset <- rename(jazz_subset, jazz = mean)
folk_subset <- rename(folk_subset, folk = mean)
electronic_subset <- rename(electronic_subset, electronic = mean)
classical_subset <- rename(classical_subset, classical = mean)
hip_hop_subset <- rename(hip_hop_subset, hiphop = mean)

# join means with years as rows and genres as columns
master_list <- list(rock_subset, pop_subset, funk_subset,
                    electronic_subset, classical_subset,
                    hip_hop_subset, folk_subset, jazz_subset)
master <- master_list %>% reduce(full_join, by = "year")
View(master)

# perform ANOVA test
interaction <- aov(mean ~ era * genre, data = averages)
summary(interaction)