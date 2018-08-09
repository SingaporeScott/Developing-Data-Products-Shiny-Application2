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
                  tabPanel("About", br(), "Car-buyers have many options when it comes to buying cars. They can decide to buy a brand new car off the dealership or decide to purchase a car from the resale market. This Shiny application aids car buyers in purchasing used cars. Move the sliders and buttons to look at the selection of cars on sale that suits your preference! Click on the next tab to look at the selection of cars available." ),
                  tabPanel("Selection of Cars", br(), "From the criteria you entered earlier, these are the cars currently on sale. Select a single car and it will bring you to a price analysis for similar cars in the last 300 days. Please click the next tab.",dataTableOutput("table")),
                  tabPanel("Price Trend", br(), "Average Price Trend of Cars Sold Within Previous Days",plotlyOutput("pricetrend"), textOutput("text1"))
      )
   
    )
  )
))
