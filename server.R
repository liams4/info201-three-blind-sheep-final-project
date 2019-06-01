library(shiny)
library(dplyr)
library(ggplot2)

data <- read.csv("data/states_all_extended.csv")

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