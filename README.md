# info201-three-blind-sheep-final-project: U.S. Education Funding and Impact on Academic Performance


## About the Data
This project sources most of its data from "U.S. Education Datasets: Unification Project" created by Roy Garrard, and posted for public use on Kaggle. The data is described as "K-12 financial, enrollment, and achievement data in one place", which is "designed to bring together multiple facets of U.S. education data into one convenient CSV". For this project we use 'states_all_extended.csv, which contains information on race and gender enrollment as well, though we only use the race data for this project (refer to tab 3)'.

[The data can be viewed here](https://www.kaggle.com/noriuk/us-education-datasets-unification-project)

### The data contains the following variables( columns):
Note: These are only the columns which we filtered through and kept for this project from the extended data set. 

Identification
* PRIMARY_KEY: A combination of the year and state name.
* YEAR
* STATE

Enrollment by Race/Ethnicity
* Total_Enrollment: Total number of students enrolled
* Grades_ALL_AS: Number of students enrolled whose race/ethnicity is identified as 'Asian'
* Grades_ALL_AM: Number of students enrolled whose race/ethnicity is identified as 'American Indian or Alaska Native'
* Grades_ALL_HI: Number of students enrolled whose race/ethnicity is identified as 'Hispanic/Latino'
* Grades_ALL_BL: Number of students enrolled whose race/ethnicity is identified as 'Black/African American'
* Grades_ALL_WH: Number of students enrolled whose race/ethnicity is identified as 'White'
* Grades_ALL_HP: Number of students enrolled whose race/ethnicity is identified as 'Hawaiian Native/Pacific Islander'
* Grades_ALL_TR: Number of students enrolled whose race/ethnicity is identified as 'Two or more races'

Financial
*TOTAL_EXPENDITURE: The total expenditure for the state.

Academic Achievement
* AVG_MATH_4_SCORE: The average score for fourth graders taking the NAEP math exam for a given state
* AVG_MATH_8_SCORE: The average score for eight graders taking the NAEP math exam for a given state
* AVG_READING_4_SCORE: The average score for fourth graders taking the NAEP reading exam for a given state
* AVG_READING_8_SCORE: The average score for eighth graders taking the NAEP reading exam for a given state

### Annual Survey of State and Local Government Finances- 2005, 2011, 2015
We use three datasets from 2005, 2011, and 2015 sourced from survey data from the United States Census bureau. The survey 
contains data on "revenue, expenditure, debt, and assets (cash and security holdings) for US governments. There are statistics for the 50 state areas and the District of Columbia, as well as a national summary", all for a given year in the form of an Excel document. Our group reformatted the excel files into a CSV file to make the data easier to read into the server file. 

The data contains 51 columns which correspond to the 50 states and the District of Columbia. When filtering, only one row was kept, giving the total revenue for each state (which combined local and state revenue).

[Annual Survey of State and Local Government Finances](https://www.census.gov/programs-surveys/gov-finances/data/datasets.2013.html)

## Tab 1: Homepage
The homepage tab gives users a general introduction to the project and the data used. This page also gives the sources of data used in this project. 

## Tab 2: Maps
The map is an interactive feature which total spending, percentage of revenue from state, and test score results in math and reading scores for grades 4 and 8. The map is meant to observe if there is a correlation between education funding and academic performance.
No correlation was clearly established between education funding and academic performance. 

## Tab 3: Race
The race tab contains an interactive feature where the user can switch between a bar graph and a data table containing the data used 
to create the bar graph. The data used in this tab is filtered from the states_all_extended.csv, and uses only the enrollment by race and primary key columns. The bar graph displays the enrollment of students in every state by race to show the size of different race demographics of students enrolled in each state. This tab is meant to be compared against the "Maps" and "Spending" tabs to observe if 
students of marginalized race backgrounds are impacted more by a relationship between poor education funding and poor academic performance. While this patterned was observed in some states, no nationwide trend was observed.

Note: The data may have some mistakes because some states have a greater total of the different races of students enrolled compared to the value listed in the "Total_Enrollment" column. This is why the length of columns varied, and some compared race demographics are
unusual. District of Columbia is an example of this. 

## Tab 4: Spending
The spending tab contains an interactive feature which allows the user to look at different types of test scores (either reading or math), as well as switching between years (2005, 2011, and 2015). This plot is meant to observe if there is a correlation between education funding and academic performance. The math scores may have an established pattern, but reading scores do not. 

## Tab 5: About Us 
This tab displays the full name, major, and an image of each group member who collaborated on creating this project. This tab is not
related to the data or questions of the project, it is only informing about the creators of the project. 

## Link to the App
This app can be viewed here:
[Our App](https://liams5.shinyapps.io/info201-three-blind-sheep-final-project/)

