#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Used Car Price Trend Analysis"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("Price",
                   "Price Range",
                   min = 0,
                   max = 25000,
                   value = 20000),
       sliderInput("Mileage",
                   "Mileage of Car",
                   min = 0,
                   max = 200000,
                   value = 200000),
       radioButtons("Trans", "Transmission Type", c("All" = "all",
                                                          "Automatic" = "AUTO",
                                                          "Manual" = "MANUAL"))
       
    ),
    

    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Selection of Cars", br(), dataTableOutput("table")),
                  tabPanel("Price Trend", br(), "Average Price Trend of Cars Sold Within Previous Days",plotlyOutput("pricetrend"), textOutput("text1"))
      )
   
    )
  )
))
