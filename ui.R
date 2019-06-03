library(shiny)

shinyUI(fluidPage(
  navbarPage("Education",
             tabPanel("Data Intro", 
                       #Add text about data
             ),
             tabPanel("Map",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("variable", label=h3("Visualization Variable"),
                                      choices=c("Funding" = "TOTAL_REVENUE", "Scores" = "GRADES_ALL_G"),
                                      selected="TOTAL_REVENUE")
                        ),
                        mainPanel(
                          plotOutput("usaMap")
                        )
                      )
             ),
             tabPanel("Race"
             ),
             tabPanel("Spending Over Time"
             ),
             tabPanel("About us"
             )
             ))
)