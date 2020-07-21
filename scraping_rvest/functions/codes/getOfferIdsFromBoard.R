

getOfferIdsFromBoard <- function(tags)
{
  
  offer.ids <- tags %>%
    rvest::html_attr(name = "data-ad-id")
  
  return(offer.ids)
  
}
