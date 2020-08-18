# name: Jovany Cota
# date: 08-18-20
# purpose: daily assignment 08

# Question 1: Plot the daily new cases overlaid with a 7-day rolling mean for
# a state of your choice (cannot be Alabama)

library(zoo)
library(tidyverse)
url = ('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')
covid = read_csv(url)

covid %>%
    filter(state == "California") %>%
    group_by(date) %>%
    summarise(cases = sum(cases)) %>%
    mutate(newCases = cases - lag(cases),
           roll7 = rollmean(newCases, 7, fill = NA, align = "right")) %>%
    ggplot(aes(x = date)) +
    geom_col(aes(y = newCases), col = "yellow") +
    geom_line(aes(y = roll7), col = "darkred", size = 1, scale = "free_y") +
    ggthemes::theme_excel() +
    labs(title = paste("New Reported cases by day in California"))
