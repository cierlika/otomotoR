
getOfferTags <- function(page, timeout)
{
  options(timeout = timeout)
  
  offers <- page %>%
    rvest::html_nodes(xpath = "//div/h2/a[@class='offer-title__link']")
  
  return(offers)
}

