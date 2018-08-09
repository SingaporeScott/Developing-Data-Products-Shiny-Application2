#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(knitr)
library(plotly)
library(dplyr)
set.seed(0)

# Reactive Function to show Table of cars to choose form 

shinyServer(function(input, output) {
  
    output$table <- renderDataTable({
      usedcarsdat <- read.csv("https://www.engineeringbigdata.com/wp-content/uploads/usedcars.csv") 
      pricechoice <- input$Price
      mileschoice <- input$Mileage
      filter_data <- filter(usedcarsdat, price <= pricechoice & mileage <= mileschoice)
      if (input$Trans != "all") {
        filter_data <- filter_data[filter_data$transmission == input$Trans,]
      }
    filter_data

  }, selection = "single")
    
      
    output$pricetrend <- renderPlotly({
      choice <- input$table_rows_selected
      pricechoice <- input$Price
      mileschoice <- input$Mileage
      filter_data <- filter(usedcarsdat, price <= pricechoice & mileage <= mileschoice)
      if (input$Trans != "all") {
        filter_data <- filter_data[filter_data$transmission == input$Trans,]
      }
      
      
      thiscar <- filter_data[choice,3]
      last300price <- rnorm(n=300,-500,500) + thiscar
      last300time <- c(-299:0)
      last300price[300] = thiscar
      last300 <- data.frame(Time=last300time, Price=last300price)
      x <- list(
        title = "Time"
      )
      y <- list(
        title = "Price"
      )
      p<- plot_ly(last300, x=last300$Time, y=last300$Price,mode = "lines") %>%
        layout(xaxis = x, yaxis = y, width = 550, height = 300)
      
      p
    })
      
    
    
    

    
    
    
    
    })

    
    
    
    
    
    
    
    
    
    
  
  
