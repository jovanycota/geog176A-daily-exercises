# name: Jovany Cota
# date: 08-12-20
# purpose: daily assignment 06

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)
head(covid)


# question 1

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)

covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state) ->
  top_states
covid %>%
  filter(state %in% top_states) %>%
  group_by(state, date) %>%
  summarise(cases = sum(cases)) %>%
  ungroup() %>%
  ggplot(aes(x = date, y = cases, color = state)) +
  geom_line(size = 1) +
  facet_wrap(~state) +
  ggthemes::theme_excel() +
  theme(legend.position = 'NA') +
  labs(title = "States with the MOST Cases",
       subtitle = "Data Source: NY-Times",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")

# question 2

covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col(fill = "blue", color = "darkblue", alpha = .25) +
  geom_line(color = "darkblue", size = 2) +
  ggthemes::theme_excel() +
  labs(title = "Daily Total Cases in the United States",
       subtitle = "Data source: NY-Times",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06")
