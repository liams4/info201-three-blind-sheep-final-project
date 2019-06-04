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
                                      choices=c("Funding" = "TOTAL_REVENUE", "Scores" = "GRADES_ALL_G"),
                                      selected="TOTAL_REVENUE")
                        ),
                        mainPanel(
                          plotOutput("usaMap")
                        )
                      )
             ),
             tabPanel("Race",
                      h2("Critical Question: Does the relationship between education funding and academic performace
                      greater impact students of marginalized races?"),
                  tabsetPanel( type = "tabs",
                    tabPanel("Plot", plotOutput("race_plot")), 
                    tabPanel("Table", tableOutput("race_data"))
                             ), #create dashboard with tabs for bar graph and table
                             h3("About the Data"),
                             p("This data table was created from the education megadata. This data table shows the total enrollment as well as
                      the enrollment of students of each race demographic for the year 2015 for each state."),
                             h3("Analysis"),
                             p(
                               "This data shows the enrollment demographics of students of different races/ethnicities. This tab
                      explores if there is a correlation in the race/ethnicity demographics within a state, and the state's
                               education funding and academic performace to see if students of marginalized races are greater impacted
                               by poor education funding. The correlation between funding and academic funding has already been established.
                               "),
                            p(
                               "The data contains data of race demogrpahics for enrollment only, not any data on academic performance. 
                               There for no direct correlation can be established between race/ethnicity demographics within a state, and the
                               state's education funding/academic performance relationship. However it can be observed that students of 
                      marginalized races are greater impacted by the poor education funding/academic performance relationship. "
                             )
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