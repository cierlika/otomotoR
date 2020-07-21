


getOfferURLsFromBoard <- function(tags)
{
  
  offer.URLs <- tags %>%
    rvest::html_attr(name = "href")
  
  return(offer.URLs)
  
}
