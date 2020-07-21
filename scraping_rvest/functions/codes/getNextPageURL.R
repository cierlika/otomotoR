


getNextPageURL <- function(currentPageNumber, coreURL="https://www.otomoto.pl/osobowe/uzywane/", suffixURL="?page=")
{
  
  nextPageNumber <- currentPageNumber + 1
  
  newURL <- paste0(coreURL, suffixURL, nextPageNumber)
  
  return(newURL)
  
}


