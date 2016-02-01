#ui.R
library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Child Height Estimator SI"),
    sidebarPanel(
      p('Enter parent heights and press the "Tell me!" button to estimate a child\'s height.'),
      p('Please make sure the heights are in centimeters'),
      p('The result is the 95% confidence interval based on Galton\'s data from 1885.'),
      p('You may access the sales presentation for this product'),
      a(href="http://rpubs.com/titosdragonas/devdatprod-2","here")
    ),
    mainPanel(
      numericInput('momcm','Height of mom (cm)',0),
      numericInput('dadcm','Height of dad (cm)',0),
      actionButton("calculate","Tell me!"),
      br(),
      br(),
      p("output:"),
      verbatimTextOutput("out")
    )
  )
)