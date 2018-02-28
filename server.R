#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    
    model <- reactive({
        lm(mtcars[,input$Yvar] ~ mtcars[,input$Xvar])
    })
    
    output$plot1 <- renderPlot({
        plot(mtcars[,input$Xvar], mtcars[,input$Yvar], xlab = input$Xvar,
             ylab = input$Yvar, bty = "n", pch = 16,
             xlim = c(floor(min(mtcars[,input$Xvar])), ceiling(max(mtcars[,input$Xvar]))),
             ylim = c(floor(min(mtcars[,input$Yvar])), ceiling(max(mtcars[,input$Yvar]))))
        if(input$showModel){
            abline(model(), col = "red", lwd = 2)
        }
    })
    
    output$corr1 <- renderText({
        cor(mtcars[,input$Yvar],mtcars[,input$Xvar])
    })
    
    output$coef2 <- renderText({
        model()$coef[2]
    })
    
    output$coef1 <- renderText({
        model()$coef[1]
    })
    
})

