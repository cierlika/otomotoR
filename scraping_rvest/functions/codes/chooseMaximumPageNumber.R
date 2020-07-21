
chooseMaximumPageNumber <- function(page.numbers)
{
  
  suppressWarnings({
    page.numbers_num <- as.numeric(page.numbers)
  })
  
  maximumNumber <- max(page.numbers_num, na.rm=TRUE)
  
  return(maximumNumber)
  
}
