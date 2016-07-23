library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Fertility Predictors Swiss Provinces In 1888"),
  
  # Selects which variable to plot against fertility
  # specify what color to plot the points
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("% males in agriculture" = "Agriculture", 
                     "% draftees w/highest Army exam score" = "Examination", 
                     "% education beyond primary school" = "Education",
                     "% Catholic as opposed to Protestant" = "Catholic",
                     "live births who live less than 1 year" = "Infant.Mortality")
                ),
    
    textInput("color", "Plot Color", value = "blue", placeholder = "Type a Color")
  ),
  
  # Show the formula table of regression coefficients and plot of the requested variable against fertility
  mainPanel(
    h3(textOutput("formula")),
    
    tableOutput("FertSummary"),
    
    plotOutput("Scatter")
    
  )
))

