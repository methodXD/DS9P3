#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Mtcars Linear Model and Variable Correlation"),
    sidebarLayout(
        sidebarPanel(
            selectInput("Yvar", "Y variable", choices = names(mtcars), selected = "mpg"),
            selectInput("Xvar", "X variable", choices = names(mtcars), selected = "hp"),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE)
    ),
    mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Model", br(), 
                        plotOutput("plot1"),
                        h4("Correlation of variables:"),
                        textOutput("corr1"),
                        h4("Linear Model Slope:"),
                        textOutput("coef2"),
                        h4("Linear Model Intercept:"),
                        textOutput("coef1")
                    ),
                    tabPanel("Documentation", br(), 
                        h4("Purpose"),
                        tags$p("This application allows the user to investigate the relationship between variables in the Motor Trend Car Road Tests (mtcars) dataset through the use of variable drop-down boxes and the resulting scatter plot and linear models."),
                        h4("Data"),
                        tags$p("The mtcars dataset was extracted from the 1974 Motor Trends US magazine and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
                        h4("Sidebar"),
                        tags$p("In the sidebar, there are two drop-down boxes to select the Y and X variables to be plotted in the scatterplot. By default, the 'mpg' is selected as the Y variable and 'hp' is selected as the X variable. There is also a checkbox to select whether to show or hide the resulting linear model in the plot."),
                        h4("Main Panel"),
                        tags$p("The main panel displays a scatterplot between the two variables selected in the sidebar. A reactive function will calculate a linear model and display this line in red on the plot. There are three calculations reactively provided below the plot:"),
                        tags$div(
                            tags$ul(
                                tags$li("The correlation between the variables"),
                                tags$li("The slope of the linear model"),
                                tags$li("The intercept of the linear model")
                            )
                        )
                    )
        )
    )
)
))