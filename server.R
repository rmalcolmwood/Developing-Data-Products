library(shiny)

shinyServer(function(input, output) {
  model1 <- lm(nox ~ age, data = Boston)
      model1pred <- reactive({
      ageInput <- input$sliderAGE
      predict(model1, newdata = data.frame(age = ageInput))})
  
  output$plot1 <- renderPlot({
    ageInput <- input$sliderAGE
      plot(Boston$age, Boston$nox, xlab = "% Houses Built Prior to 1940",
         ylab = "Nitrous Oxide Level", bty = "n", pch = 16,
         xlim = c(0, 100), ylim = c(0.3, 1))
    
      if(input$showModel1){
            abline(model1, col = "red", lwd =2)}
      if(input$showSmooth){
            lines(lowess(Boston$age, Boston$nox), col = "blue", lwd = 3,lty=2)}
      points(ageInput, model1pred(), col = "red", pch = 16, cex = 2)})
          
  output$pred1 <- renderText({
    model1pred()})
    })