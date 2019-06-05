library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  navbarPage(
    theme = shinytheme("flatly"),
    "Education!",
    tabPanel("Data Intro", 
             h1("U.S. Education Funding and Impact on Academic Performance", align="center"),
             img(src="classroom.jpg", align = "center"),
             h2("Introduction"),
             p("Does more educational funding lead to better academic performance? Most people believe that better-funded 
               schools help student perform better because students have access to state-of-the-arts facilities, qualified teachers,
               an easier transition to college and much more benefits to be named. Schools in the United States are
               funded by federal, state, and local sources. Depending on where an individual lives, this can create large
               disparities in funding between wealthy and impoverished communities."),
             h2("Background Information"),
             p("Our group has chosen one dataset for this project - 'the U.S. Education Dataset: Unification Project.' 
               This dataset contains information about K-12 education in the United States. It separates data by state, 
               and includes information about states’ revenue, education spending, and student test scores, and also separates 
               the data by ethnicity, gender, and grade level in each state."),
             h2("Source"),
             a("U.S. Education Dataset", href="https://www.kaggle.com/noriuk/us-education-datasets-unification-project#states_all_extended.csv"),
             br(),
             a("State Nonfiscal Public Elementary/Secondary Education Survey Data", href="https://nces.ed.gov/ccd/stnfis.asp"),
             br(),
             a("Annual Survey of School System Finances", herf="https://www.census.gov/programs-surveys/school-finances/data/tables.html"),
             br(),
             a("National Report Card", href="https://www.nationsreportcard.gov/data_tools.aspx")
    ),
    
    tabPanel("Map",
             sidebarLayout(
                sidebarPanel(radioButtons("variable", label=h3("Visualization Variable"),
                                          choices=c("Funding" = "TOTAL_REVENUE", "Percent Spent on Education" = "Percent_Used_On_Education",
                                                    "4th Grade Math Scores" = "AVG_MATH_4_SCORE", "4th Grade Reading Scores" = "AVG_READING_4_SCORE",
                                                    "8th Grade Math Scores" = "AVG_MATH_8_SCORE", "8th Grade Reading Scores" = "AVG_READING_8_SCORE"),
                                          selected="TOTAL_REVENUE")),
                mainPanel(
                  plotOutput("usaMap")
                ))),
    
    tabPanel("Race",
             h2("Critical Question: Does the relationship between education funding and academic performace
                greater impact students of marginalized races?"),
             tabsetPanel( type = "tabs",
                          tabPanel("Plot", plotOutput("race_plot")), 
                          tabPanel("Table", tableOutput("race_data"))), #create dashboard with tabs for bar graph and table
             h3("About the Data"),
             p("This data table was created from the education megadata. This data table shows the total enrollment as well as
                                         the enrollment of students of each race demographic for the year 2015 for each state."),
             h3("Analysis"),
             p("This data shows the enrollment demographics of students of different races/ethnicities. This tab
               explores if there is a correlation in the race/ethnicity demographics within a state, and the state's
               education funding and academic performace to see if students of marginalized races are greater impacted
               by poor education funding. The correlation between funding and academic funding has already been established."),
             p(
                "The data contains data of race demogrpahics for enrollment only, not any data on academic performance. 
                There for no direct correlation can be established between race/ethnicity demographics within a state, and the
                state's education funding/academic performance relationship. However it can be observed that students of 
                marginalized races are greater impacted by the poor education funding/academic performance relationship. "
              )),
    
    tabPanel("Spending And Test Scores Over Time", 
             sidebarLayout(
               sidebarPanel(
                 radioButtons("year", label="Year",
                              choices=c(2005, 2011, 2015),
                              selected = 2005),
                 radioButtons("score_type", label="Score Type",
                              choices=c("Reading", "Math"),
                              selected="Reading")),
               mainPanel(
                 plotOutput("spending_and_scores_over_time_plot"),
                 h3("heading"),
                 p(
                   "From this plot we can clearly see the positive correlation with spending 
                   and math scores for both grades 4 and 8. There is not an obvious linear 
                   correlation between spending and reading scores, but a small correlation
                   does exist. Over the years, we can also see than an increase in spending
                   led to an higher test score..."
                 )
               ),
               
               
             )),
    
    tabPanel("About us",
             h1("About Us", align="center"),
             h2("Anusha"),
             p("Major: Law Societies and Justice; Minor: Informatics"),
             h2("Brad"),
             p("Major: Applied Computational Mathematical Sciences & Informatics"),
             h2("Liam"),
             p("Major: Informatics"),
             h2("Anh"),
             p("Major: English; Minor: Informatics")
            )
    )
  ))