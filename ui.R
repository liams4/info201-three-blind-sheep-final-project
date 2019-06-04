library(shiny)

shinyUI(fluidPage(
  navbarPage("Education",
             tabPanel("Data Intro" 
                       #Add text about data
             ),
             tabPanel("Map",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("variable", label=h3("Visualization Variable"),
                                      choices=c("Funding" = "TOTAL_REVENUE", "4th Grade Math Scores" = "AVG_MATH_4_SCORE",
                                                "4th Grade Reading Scores" = "AVG_READING_4_SCORE", "8th Grade Math Scores" = "AVG_MATH_8_SCORE",
                                                "8th Grade Reading Scores" = "AVG_READING_8_SCORE"),
                                      selected="TOTAL_REVENUE")
                        ),
                        mainPanel(
                          plotOutput("usaMap")
                        )
                      )
             ),
             tabPanel("Race"
             ),
             tabPanel("Spending And Test Scores Over Time", 
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("year", label="Year",
                                       choices=c(2005, 2011, 2015),
                                       selected = 2005),
                          radioButtons("score_type", label="Score Type",
                                       choices=c("Reading", "Math"),
                                       selected="Reading")
                        ),
                        mainPanel(
                          plotOutput("spending_and_scores_over_time_plot"),
                          textOutput("spending_and_scores_over_time_text")
                        )
                      )
                      
             ),
             tabPanel("About us"
             )
             ))
)