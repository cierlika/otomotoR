
assignNewMaxPageNumber <- function(declared.last.page, maxPossibleNumber)
{
  if( is.null(declared.last.page) || declared.last.page < 1L || declared.last.page > maxPossibleNumber)
  {
    declared.last.page <- maxPossibleNumber
    message(paste0("I am going to do scraping all (", declared.last.page, ") possible pages."))
  }
  return(declared.last.page)
}
