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
             tabPanel("Map"
             ),
             tabPanel("Race and Gender"
             ),
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
      
    
  )
)
