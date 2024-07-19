library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("UCL All-Time Performance"),
  sidebarLayout(
    sidebarPanel(
      # No sidebar content for this example
    ),
    mainPanel(
      plotOutput("scatterPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Load dataset
  data <- read.csv("UCL_AllTime_Performance_Table.csv")
  
  # Render scatter plot
  output$scatterPlot <- renderPlot({
    ggplot(data, aes(x = Matches_Played, y = Points)) +
      geom_point(alpha = 0.5) +
      labs(x = "Matches Played", y = "Points") +
      theme_minimal()
  })
}

# Run the application
shinyApp(ui = ui, server = server)


