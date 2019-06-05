library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  navbarPage(
    theme = shinytheme("flatly"),
    "",
    tabPanel("Data Intro", 
             h1("U.S. Education Funding and Impact on Academic Performance", align="center"),
             HTML('<center><img src="classroom.jpg" height="300"></center>'),
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
                  plotOutput("usaMap"),
                  h3("About the Data"),
                  p("This is a map of the U.S. depicting different 2015 data based on which information the user chooses.
                    They can choose from depicting the amount of money spent on education as well as what percent that
                    is from the total revenue earned by the state. It can also show the average reading or math scores of
                    4th and 8th graders. To produce this data we used the data set on state revenue and test scores. We 
                    used dplyr's built in state map data to produce a map and provide each state with latitude and longitudes."),
                  h3("Analysis"),
                  p("Looking at the data in general, there is not a huge amount of correlation between the amount of money spent
                    with how well the students do on their tests. Looking at California and Illinois in particular, (two of the states
                    with the biggest education budgets) there seems to be a negative correlation between the amount of money spent
                    and the scores of students. However, this could be because of many unknown factors such as what the money is being
                    spent on or how seriously students take the test.")
                ))),
    
    tabPanel("Race",
             h2("Critical Question: Does the relationship between education funding and academic performace
                greater impact students of marginalized races?"),
             tabsetPanel( type = "tabs",
                          tabPanel("Plot", plotOutput("race_plot")), 
                          tabPanel("Table", tableOutput("race_data"))),
             
             
             h3("About the Data"),
             p("This data table showing student enrollment by race for each state in 2015 was created from the
              'U.S. Education Datasets: Unification Project' by Roy Garrard.
               This data table shows the total enrollment as well as the enrollment of students of each race demographic for the year 2015 for each state.
               Unfortunately, there is no demographic enrollment data by race for the states Oregon and California.
               This is why there are no columns for these two states."),
             p("The data contains data of race demogrpahics for enrollment only, not any data on academic performance. 
               Therefore, no direct correlation can be established between race/ethnicity demographics within a state, and the
               state's education funding/academic performance relationship."),
             h3("Analysis"),
             p("This data shows the enrollment demographics of students of different races/ethnicities. This tab
               explores if there is a correlation in the race/ethnicity demographics within a state, and the state's
               education funding and academic performace (seen on the map and spending tabs) to see if students of marginalized races
               are greater impacted by poor education funding. The correlation between funding and academic funding every year was 
               not established. It is not a nationwide trend that students of marginalized races are greater impacted by the poor 
               education funding/academic performance relationship. Though some states which have low education funding and academic 
               performace also have larger populations of minorities, for instance Lousiana, in these cases a relationsip is
               observable")
    ),

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

                 h3("About the Data"),
                 p("This plot showing education funding and student test scores
                    in reading and math for grades 4 and 8 in each state was 
                    created from the 'U.S. Education Datasets: Unification Project'
                    by Roy Garrard and the 'Annual Survey of State and Local 
                    Government Finances' published by the United States Census 
                    Bureau. The plot shows the percentage of each state's 
                    spending spent on education and the state's corresponding test
                    scores. The widget to the left of the plot can can be altered 
                    so that the scores and funding for 2005, 2011, and 2015 can be 
                    seen."
                 ),
                 h3("Analysis"),
                 p("For math scores, we can see that there was a positive 
                   correlation with spending on education in each of the three
                   years. For reading scores, we can see some slight correlation
                   in each of the three years, but there is no major correlation."),
                 p("We can also see that the states as a whole increased the 
                   percentage of their budgets spent on education by a small amount 
                   each year. Interestingly, even though math scores had a positive 
                   correlation with education spending in each individual year, 
                   both math and reading scores seemed to decrease on a national 
                   between 2005 and 2011 as well as 2011 and 2015. This could be
                   from an unknown variable like changing methods of education or
                   more difficult tests."),
                 p("Overall, while math scores are consistently correlated with
                    federal spending in different years, the fact that reading 
                    scores are not correlated in the different years does not 
                    allow us to make the conclusion that education spending should
                    be increased in order to better prepare students academically.
                    The fact that reading scores are not correlated with education 
                    spending while math scores are could be due to an unknown 
                    variable like a different method of teaching for 
                    reading-related coursework that is not affected by funding.")
               )

               
          
             )),
    
    tabPanel("About us",
             h1("About Us", align="center"),
             h2("Anusha"),
             HTML('<center><img src="Anusha.jpg" height="300"></center>'),
             p("Major: Law Societies and Justice; Minor: Informatics"),
             h2("Brad"),
             HTML('<center><img src="Brad.jpg" height="300"></center>'),
             p("Major: Applied Computational Mathematical Sciences & Informatics"),
             h2("Liam"),
             HTML('<center><img src="Liam.jpg" height="300"></center>'),
             p("Major: Informatics"),
             h2("Anh"),
             HTML('<center><img src="Anh.jpg" height="300"></center>'),
             p("Major: English; Minor: Informatics")
          )
    )
  ))