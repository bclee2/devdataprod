library(shiny)
library(datasets)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Make reactive expression for the formula that is shared by 
  # output$FertSummary and output$Scatter
  formulaText <- reactive({
    paste("Fertility ~", input$variable)
  })
  
  ColorText <- reactive({paste(input$color)
  })
  
  # Return the formula text for printing in the interface
  output$formula <- renderText({
    formulaText()
  })
  
  # Makes a table that has the coefficients of a linear regression fit
  # for the selected variable against fertility
  output$FertSummary <- renderTable({
    summary.lm(lm(formulaText(), data =swiss))$coefficients
  })
  
  # Makes a scatter plot of the selected variable against fertility
  output$Scatter <- renderPlot({
    plot(as.formula(formulaText()),
            data = swiss, col=ColorText())
  })
})
