

getOfferId <- function(page, timeout)
{
  options(timeout = timeout)
  
  offerId <- page %>%
    rvest::html_nodes(xpath = "//div[@class='offer-content__metabar']/div[@class='offer-meta']/span[@class='offer-meta__item']/span[@class='offer-meta__value']") %>%
    rvest::html_text()
  
  offerId[1] <- transformOfferDate(offerDate = offerId[1])
  
  return(offerId)
}
