#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Number of First Books by Year Published"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId="bins",
                        label="Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
        
            sliderInput(inputId="pub",
                        label="Total Number of Books Published (by 2019):",
                        min = min(author$n),
                        max = max(author$n),
                        value = 3)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # sub-set data to authors with at least as many books as slider
        author2 <- author %>% filter(n >= input$pub)
        author2 <- author2 %>% drop_na()
        
        # generate bins based on input$bins from ui.R
        x    <- author2$first_book
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             main="Histogram of Number of First Publications by Year",
             xlab="Year Published",
             ylab="Number of First Books Published")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
