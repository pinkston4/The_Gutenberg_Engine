library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(stats)
library(utils)
library(shiny)

source("search.R")

#Shiny UI builds layout for front end of shiny app
shinyUI(fluidPage(
  
  includeCSS("www/main.css"),
  
  fluidRow(
    column(8, offset = 2, div(
      id = "title_bar",
      "The Gutenberg Engine"
    ))
  ),
  
  fluidRow(
    column(8, offset = 2, wellPanel(
      search_input("user_search", '', ''),
      actionButton("do", "Search")
    ))
  ),
  
  fluidRow(
    column(8, offset = 2, div(
      tableOutput("search_result")
    ))
  )
 
))

