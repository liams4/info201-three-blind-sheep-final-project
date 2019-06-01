library(shiny)

shinyUI(fluidPage(
  navbarPage("Education!",
             tabPanel("Data Intro", 
                      # Add text about data
             ),
             tabPanel("Map",
             ),
             tabPanel("Race and Gender",
             ),
             tabPanel("About us",
             )
             ),
))