install.packages("shiny")
library(shiny)
ui <- fluidPage("Hello world!")
server <- function(input, output) {}
shinyApp(
  ui = ui,
  server = server
)

ui <- fluidPage(
  titlePanel("Input and Output"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose a number",
        min = 0,
        max = 100,
        value = 25)),
    mainPanel(
      textOutput(
        outputId = "text"))))

server <- function(input, output){
  output$text <- renderText({
    paste("You selected ", input$num)})
}

shinyApp(
  ui = ui,
  server = server
)
