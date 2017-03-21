library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(stats)
library(utils)
library(shiny)

source("query.R")

#setting working directory
setwd("/home/jackpinkston/the_gutenberg_engine")


#shiny server function 
shinyServer(
  function(input, output){
    
    the_query <- eventReactive(input$do, {
      query_gutenberg(as.character(input$user_search))
    })
    
    output$search_result <- renderText({
      as.character(the_query())
    })
})

