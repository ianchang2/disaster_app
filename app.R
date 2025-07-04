#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(tidyverse)
library(ggthemes)
library(rvest)
library(plotly)
library(shiny)
library(bslib)

plot_data <- read_csv("plot_data.csv")%>%
  mutate(Year = as.integer(Year),
         Count = as.integer(Count))

# Define UI for application that draws a line plot
ui <- fluidPage(
  theme = bs_theme(bootswatch = "cerulean"),
  titlePanel("Trends in U.S. Billion-Dollar Disasters (1980–2024)"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        inputId = "disaster_types",
        label = "Select Disaster Types:",
        choices = unique(plot_data$Disaster),
        selected = unique(plot_data$Disaster)
      ),
      sliderInput(
        inputId = "year_range",
        label = "Select Year Range:",
        min = min(plot_data$Year),
        max = max(plot_data$Year),
        value = c(min(plot_data$Year), max(plot_data$Year)),
        step = 1,
        sep = ""
      ),
      tableOutput("disaster_summary")
    ),
    mainPanel(
      plotlyOutput("disaster_plot")
    )
  )
)


# Define server logic required to draw a line plot
server <- function(input, output) {
  
  filtered_data <- reactive({
    plot_data %>%
      filter(
        Disaster %in% input$disaster_types,
        Year >= input$year_range[1],
        Year <= input$year_range[2])
  })
  
  # summary table
  output$disaster_summary <- renderTable({
    filtered_data() %>%
      group_by(Disaster) %>%
      summarise(Total = sum(Count)) %>%
      arrange(desc(Total))
    })
  
  # main plot
  output$disaster_plot <- renderPlotly({
    billion_disasters <- ggplot(filtered_data(), aes(x = Year, y = Count)) +
      geom_line(aes(color = Disaster), linewidth = 1) +
      geom_point(aes(color = Disaster), size = 2) +
      scale_color_manual(values = c(
        "All Disasters" = "black",
        "Flooding" = "dodgerblue",
        "Hurricane" = "orange",
        "Tropical Cyclone" = "seagreen",
        "Drought" = "darkgoldenrod2",
        "Wildfire" = "green4",
        "Winter Storm" = "lightskyblue3",
        "Freeze" = "powderblue")
        ) +
      labs(
        x = "Year",
        y = "Number of Events") +
      theme_minimal(base_size = 12) +
      theme(
        plot.title = element_text(face = "bold", size = 24),
        panel.grid = element_blank(),
        legend.position = "none")
    
    ggplotly(billion_disasters) %>%
      layout(xaxis = list(autorange = TRUE),
             yaxis = list(autorange = TRUE),
             legend = list(title = list(text = "Disaster Type")))
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
