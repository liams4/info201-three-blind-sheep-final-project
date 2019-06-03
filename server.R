library(shiny)
library(dplyr)
library(ggplot2)

data <- read.csv("data/states_all_extended.csv")

# Filter relevant columns and states
spending_data <- data %>% select(STATE, YEAR, TOTAL_REVENUE, FEDERAL_REVENUE, 
                                 STATE_REVENUE, LOCAL_REVENUE, TOTAL_EXPENDITURE, 
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
  
  # Gets all of spending the data specific to the year passed as a parameter
  get_year_spending_data <- function(year) {
    spending_data <- spending_data_2005
    if (year == 2011) {
      spending_data <- spending_data_2011
    } else if (year == 2015) {
      spending_data <- spending_data_2015
    } 
    spending_data
  }
  
  # Creates a scatter plot of states' spending data in the year specified by
  # the user versus the states' 8th grade scores in the test type specified 
  # by the user
  output$spending_and_scores_over_time_plot <- renderPlot({
    
    x_label <- paste('State Expenditure', input$year)
    y_label <- paste0('State Grade 8 ', input$score_type, ' Score ', input$year)
    year <- get_year_spending_data(input$year)
    
    expenditure <- year$TOTAL_EXPENDITURE
    scores <- year$AVG_READING_8_SCORE
    if (input$score_type == 'Math') {
      scores <- year$AVG_MATH_8_SCORE
    }
    
    ggplot() + 
      geom_point(aes(x=expenditure, y=scores)) +
      labs(x = x_label, y = y_label)
  })
  
  # Prints a summary text about the "spending_and_scores_over_time_plot" plot
  output$spending_and_scores_over_time_text <- renderText({
    "This plot clearly shows/does not show that .."
  })
  
})