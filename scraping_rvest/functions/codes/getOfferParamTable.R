

getOfferParamTable <- function(page, timeout)
{
  options(timeout = timeout)
  
  paramTable <- page %>%
    rvest::html_node(xpath = "//div[@id='parameters']") 
  
  return(paramTable)
  
}
