library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)

data <- read.csv("data/states_all_extended.csv")
total_revenue_by_state <- read.csv("data/total_revenue_by_state.csv")
@@ -86,18 +87,38 @@ shinyServer(function(input, output) {
  # Prints a summary text about the "spending_and_scores_over_time_plot" plot
  output$spending_and_scores_over_time_text <- renderText({
    "This plot clearly shows/does not show that .. also the total U.S revenue went up every time period"
    
  })
  
  #Server stuff for race data
  data <- read.csv("data/states_all_extended.csv")
  state <- read.csv("data/states.csv", sep=",") %>% 
    mutate(State = tolower(State)) %>% 
    mutate(State = str_replace_all(State, " ", "_"))
  race_data <- data %>% 
    select(STATE, YEAR, ENROLL, GRADES_ALL_AS, GRADES_ALL_AM, 
           GRADES_ALL_HI, GRADES_ALL_BL, GRADES_ALL_WH, GRADES_ALL_HP, GRADES_ALL_TR)  %>% 
    filter(YEAR == "2015") %>% 
    filter(STATE != "AMERICAN_SAMOA", STATE != "BUREAU_OF_INDIAN_EDUCATION", STATE != "DEPARTMENT_OF_DEFENSE_EDUCATION_ACTIVITY",
           STATE != "GUAM", STATE != "PUERTO_RICO", STATE != "U.S._VIRGIN_ISLANDS") %>% 
    mutate(GRADES_ALL_AS = ifelse(!is.na(GRADES_ALL_AS), GRADES_ALL_AS, "-")) %>% 
    mutate(GRADES_ALL_AM = ifelse(!is.na(GRADES_ALL_AM), GRADES_ALL_AM, "-")) %>% 
    mutate(GRADES_ALL_HI = ifelse(!is.na(GRADES_ALL_HI), GRADES_ALL_HI, "-")) %>% 
    mutate(GRADES_ALL_BL = ifelse(!is.na(GRADES_ALL_BL), GRADES_ALL_BL, "-")) %>% 
    mutate(GRADES_ALL_WH = ifelse(!is.na(GRADES_ALL_WH), GRADES_ALL_WH, "-")) %>% 
    mutate(GRADES_ALL_HP = ifelse(!is.na(GRADES_ALL_HP), GRADES_ALL_HP, "-")) %>% 
    mutate(GRADES_ALL_TR = ifelse(!is.na(GRADES_ALL_TR), GRADES_ALL_TR, "-")) %>% 
    rename(Asian = "GRADES_ALL_AS", American_Indian_or_Alaska_Native = "GRADES_ALL_AM", Hispanic_or_Latino = "GRADES_ALL_HI", 
           Black = "GRADES_ALL_BL", White = "GRADES_ALL_WH", Hawaiian_Native_or_Pacific_Islander = "GRADES_ALL_HP",
           Two_or_More_Races = "GRADES_ALL_TR", State = "STATE", Total_Enrollment = "ENROLL") %>% 
    select(-YEAR)
  
  race_data_tidied <- race_data %>% 
    gather(key = state,
           value = enrollment,
           -State, -Total_Enrollment) %>% 
    mutate(State = tolower(State)) %>% 
    full_join(state, by = "State")
  
  output$race_plot <- renderPlot({
    race_plot <- ggplot(race_data_tidied) +
      geom_col(aes(x= Abbreviation, y = enrollment, fill = state)) +
      labs(title = "State Vs. Race Demographics of Students Enrolled",
           x = "State", 
           y = "Enrollment by Race",
           fill = "Race/Ethnicity") +
      theme(axis.text.y=element_blank(),
            axis.ticks.y=element_blank())
    race_plot
  })
  
  output$race_data <- renderTable({
    race_data <- data %>% 
      select(STATE, YEAR, ENROLL, GRADES_ALL_AS, GRADES_ALL_AM, 
             GRADES_ALL_HI, GRADES_ALL_BL, GRADES_ALL_WH, GRADES_ALL_HP, GRADES_ALL_TR)  %>% 
      filter(YEAR == "2015") %>% 
      filter(STATE != "AMERICAN_SAMOA", STATE != "BUREAU_OF_INDIAN_EDUCATION", STATE != "DEPARTMENT_OF_DEFENSE_EDUCATION_ACTIVITY",
             STATE != "GUAM", STATE != "PUERTO_RICO", STATE != "U.S._VIRGIN_ISLANDS") %>% 
      mutate(GRADES_ALL_AS = ifelse(!is.na(GRADES_ALL_AS), GRADES_ALL_AS, "-")) %>% 
      mutate(GRADES_ALL_AM = ifelse(!is.na(GRADES_ALL_AM), GRADES_ALL_AM, "-")) %>% 
      mutate(GRADES_ALL_HI = ifelse(!is.na(GRADES_ALL_HI), GRADES_ALL_HI, "-")) %>% 
      mutate(GRADES_ALL_BL = ifelse(!is.na(GRADES_ALL_BL), GRADES_ALL_BL, "-")) %>% 
      mutate(GRADES_ALL_WH = ifelse(!is.na(GRADES_ALL_WH), GRADES_ALL_WH, "-")) %>% 
      mutate(GRADES_ALL_HP = ifelse(!is.na(GRADES_ALL_HP), GRADES_ALL_HP, "-")) %>% 
      mutate(GRADES_ALL_TR = ifelse(!is.na(GRADES_ALL_TR), GRADES_ALL_TR, "-")) %>% 
      rename(Asian = "GRADES_ALL_AS", American_Indian_or_Alaska_Native = "GRADES_ALL_AM", Hispanic_or_Latino = "GRADES_ALL_HI", 
             Black = "GRADES_ALL_BL", White = "GRADES_ALL_WH", Hawaiian_Native_or_Pacific_Islander = "GRADES_ALL_HP",
             Two_or_More_Races = "GRADES_ALL_TR", State = "STATE", Total_Enrollment = "ENROLL") %>% 
      select(-YEAR)
    race_data
  })  
  
})
}) 