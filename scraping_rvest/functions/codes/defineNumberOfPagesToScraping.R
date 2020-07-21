

defineNumberOfPagesToScraping <- function(board.page, last.page, timeout)
{
  options(timeout = timeout)
  pageNumbersList <- getPageNumbersList(page = board.page, timeout = timeout)
  maximumPageNumber <- chooseMaximumPageNumber(page.numbers = pageNumbersList)
  last.page <- assignNewMaxPageNumber(declared.last.page = last.page, maxPossibleNumber = maximumPageNumber)
  
  return(last.page)
  
}

