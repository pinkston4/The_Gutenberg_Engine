library(commonmark)
library(desc)
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(stats)
library(utils)
library(roxygen2)
library(redland)

world <<- new("World")
storage <<- new("Storage", world, "hashes", name="", options="hash-type='bdb'")
model <<- new("Model", world=world, storage, options="")
parser <<- new("Parser", world)

query_gutenberg <- function(userinput){
  queryString <- sprintf('PREFIX dcterms: <http://purl.org/dc/terms/> 
                     SELECT  ?title ?link
                     WHERE {  ?link dcterms:title  ?title 
                        Filter regex(?title, "%s", "i")
                     }', userinput)
  query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
  queryResult <- executeQuery(query, model)
  result <- getNextResult(queryResult)
  result[[2]] <- gsub('<', '', result[[2]])
  result[[2]] <- gsub('>', '', result[[2]])
  result[[2]] <- paste0("<button><a href='",  result[[2]], "' target='_blank'>Download_Page</a></button>")
  result_list <<- data.frame(matrix(result, nrow=1, ncol=2))
  
  counter <-1L
  
  while(counter < 10L){
    temp <- getNextResult(queryResult)
    temp[[2]] <- gsub('<', '', temp[[2]])
    temp[[2]] <- gsub('>', '', temp[[2]])
    temp[[2]] <- paste0("<button><a href='",  temp[[2]], "' target='_blank'>Download_Page</a></button")
    
    if(is.null(temp)){
      break
    }
    
    temp_frame <-data.frame(matrix(temp, nrow=1, ncol=2))
    result_list <<- rbind(result_list, temp_frame)
    counter <- counter + 1L
  }
  
  colnames(result_list)[1] <- "Title"
  colnames(result_list)[2] <- "Download"
  
  return(result_list)
  
}