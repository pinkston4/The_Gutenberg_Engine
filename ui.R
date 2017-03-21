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
  titlePanel("The Gutenberg Engine"),
  
  fluidRow(
    column(8, wellPanel(
      search_input("user_search", '', ''),
      actionButton("do", "Search")
    ))
  ),
  
  fluidRow(
    column(6, wellPanel(
      verbatimTextOutput("search_result")
    ))
  )
 
))

