


getOffersInfo_avoidErr <- function(offer.type = "a", startPageNr = 1, stopPageNr = 10, init.df = NULL, output.name = "offers", sleep = 10, timeout = 4000000, n_iter = 100)
{
  
  ## Assign values for first loop requirement
  assign(x = "metaData", 
         value = list(pageNumber = startPageNr, 
                      ifFirstRun = TRUE, 
                      ifStopFunction = FALSE), 
         envir = globalenv())
  i <- 1
  
  while( !get(x = "metaData", envir = globalenv())$ifStopFunction )
  {
    tryCatch(
      expr = {
        getOffersInfo(
          offer.type = offer.type, ## Possible values: "a" - all; "n" - new; "u" - used
          startPageNr = globalenv()$metaData$pageNumber, ## Page number to start; default 1
          stopPageNr = stopPageNr, ## Page number to stop; default 10; if NULL then running function to last page
          init.df = ifelse2(globalenv()$metaData$pageNumber > startPageNr, output.name, init.df), ## Declare data frame you have if you want add info about new offers to it
          output.name = output.name, ## An output data frame name. Function create date frame with that name; default "offers"
          sleep = sleep, ## Forced break between scraping next offer pages; default 10; do not overload the website with your activity
          timeout = timeout ## Time required to interrupt the connection. Too low value should cause errors.
        )
    },
    error = function(e)
    {
      message(paste0("The ",i ,". error has occured. ", e))
      checkingIfLastIteration(currentIter = i, maxIteration = n_iter)
      i <- i+1
    }
    )
  }
  
  return(invisible())
  
}
