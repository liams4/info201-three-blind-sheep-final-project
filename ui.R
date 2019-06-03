library(shiny)

shinyUI(fluidPage(
  navbarPage("Education!",
             tabPanel("Data Intro" 
                      # Add text about data
             ),
             tabPanel("Map"
             ),
             tabPanel("Race"
             ),
             tabPanel("Spending Over Time"
             ),
             tabPanel("About us"
             )
             ))
)