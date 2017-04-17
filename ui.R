library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Town Pollution Level Based on Proportion of Homes Built Prior to 1940"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderAGE", "What is the % of Homes Built Prior to 1940 in the Town?", 0, 100, value = 20),
      checkboxInput("showModel1", "Show/Hide Linear Model", value = TRUE),
      checkboxInput("showSmooth", "Show/Hide Smooth Line", value = TRUE)),
    
  mainPanel(
    plotOutput("plot1"),
    h3("Predicted Nitrous Oxide Level from Linear Model:"),
    textOutput("pred1"))
    )
))