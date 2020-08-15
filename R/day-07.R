# name: Jovany Cota
# date: 08-13-20
# purpose: daily exercise 07

# question 1

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)
head(covid)

region = data.frame(state = state.name, region = state.region)
head(region)


covid %>%
  right_join(region, covid, by = "state") %>%
  group_by(region, date) %>%
  summarize(cases = sum(cases), na.rm = TRUE,
            deaths = sum(deaths)) %>%
  ungroup() %>%
  select(date, region, cases, deaths) %>%
  pivot_longer(cols = c('cases', 'deaths')) %>%
  ggplot(aes(x = date, y = value)) +
    geom_line(aes(col = region)) +
    facet_grid(name~region, scale = "free_y") +
    ggthemes::theme_excel() +
    theme(legend.position = "bottom") +
    theme(legend.position = "NA") +
    labs(title = "Cummulative Cases and Deaths by USA Region",
        y = "Daily Cumulative Count",
        x = "Date",
        caption = "Daily Exercise 07",
        subtitle = "COVID-19 Data: NY-Times" )



