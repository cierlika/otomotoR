
## offer.type = c("a", "n", "u") 
### "a" - all (https://www.otomoto.pl/osobowe/) ;
### "n" - new (https://www.otomoto.pl/osobowe/uzywane/) ;
### "u" - used (https://www.otomoto.pl/osobowe/nowe/)

getOffersInfo <- function(offer.type = "a", startPageNr = 1, stopPageNr = 10, init.df = NULL, output.name = "offers", sleep = 10, timeout = 4000000)
{
  
  loadPackages(pckgs = c("tidyverse", "xml2"))
  options(stringsAsFactors = FALSE, timeout = timeout)
  
  offersInfoOutput <- defineInitialDataFrameWithOfferInfo(initDF = init.df)
  checkInputAndOutputDependencies(init.df = init.df, output.df = output.name)
  
  # assign(x = "metaData", value = list(pageNumber = startPageNr, ifFirstRun = FALSE), envir = globalenv())
  
  url.core <- defineURLcore(offerType = offer.type)
  URL.suffix <- "?page="
  pageNumber <- startPageNr
  boardURL <- paste0(url.core, URL.suffix, pageNumber)
  
  boardPage <- goToPage(URL = boardURL, timeout = timeout); Sys.sleep(sleep)
  numberOfPagesToScraping <- defineNumberOfPagesToScraping(board.page = boardPage, last.page = stopPageNr, timeout = timeout)
  
  ## ----------------------------------------------------------
  for( pageNumber in startPageNr:numberOfPagesToScraping )
  {
    cat(paste0("Start to read board no. ", pageNumber, ":\n"))
    assign(x = "metaData", 
           value = list(pageNumber = pageNumber, 
                        ifFirstRun = FALSE, 
                        ifStopFunction = get(x = "metaData", envir = globalenv())$ifStopFunction),
           envir = globalenv())
    boardURL <- paste0(url.core, URL.suffix, pageNumber)
    boardPage <- goToPage(URL = boardURL, timeout = timeout); Sys.sleep(sleep)
    newOffers <- getOffersInfoFromSingleBoard(page = boardPage, offersTable = offersInfoOutput, sleep = sleep, timeout = timeout) 
    offersInfoOutput <- rbind(offersInfoOutput, newOffers)
    assign(x = output.name, value = offersInfoOutput, envir = globalenv())
  }
  ## ----------------------------------------------------------
  
  checkingIfTerminateFunction(currentPageNr = pageNumber, lastPageNr = numberOfPagesToScraping)
  
  return(message("Done"))
  
}











