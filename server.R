library(shiny)
library(dplyr)
library(ggplot2)

data <- read.csv("data/states_all_extended.csv")

spending_data <- data %>% select(STATE, YEAR, TOTAL_REVENUE, FEDERAL_REVENUE, 
                                 LOCAL_REVENUE, TOTAL_EXPENDITURE, 
                                 AVG_MATH_4_SCORE, AVG_MATH_8_SCORE, 
                                 AVG_READING_4_SCORE, AVG_READING_8_SCORE) %>% 
                          filter(STATE != "AMERICAN_SAMOA", STATE != "BIE", 
                                 STATE != "DOD_DOMESTIC", STATE != "DOD_OVERSEAS",
                                 STATE != "GUAM", STATE != "NORTHERN_MARIANAS",
                                 STATE != "PUERTO_RICO", STATE != "VIRGIN_ISLANDS",
                                 STATE != "BUREAU_OF_INDIAN_EDUCATION", 
                                 STATE != "DEPARTMENT_OF_DEFENSE_EDUCATION_ACTIVITY",
                                 STATE != "U.S._VIRGIN_ISLANDS", 
                                 STATE != "DD", STATE != "BI", 
                                 STATE != "NORTHERN_MARIANA_ISLANDS")

spending_data_2005 <- spending_data %>% filter(YEAR == 2005)
spending_data_2011 <- spending_data %>% filter(YEAR == 2011)
spending_data_2015 <- spending_data %>% filter(YEAR == 2015)

shinyServer(function(input, output) {
  output$usaMap <- renderPlot({
    states <- map_data("state")
    filtered_2015 <- data %>%
      filter(YEAR == 2015) %>%
      select(input$variable)
    ggplot() +
    geom_polygon(data=usa, aes(x=long, y=lat, group=group), fill=filtered_2015[input$variable])
  })
})