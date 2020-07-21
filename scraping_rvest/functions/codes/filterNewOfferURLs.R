
filterNewOfferURLs <- function(page, alreadyScrapedIds, timeout)
{
  options(timeout = timeout)
  
  offersTags <- getOfferTags(page = page, timeout = timeout)
  offerIds <- getOfferIdsFromBoard(tags=offersTags)
  offerURLs <- getOfferURLsFromBoard(tags=offersTags)
  
  ifUniqueOffer <- checkIfUniqueOffer(newIds = offerIds, alreadyScrapedIds = alreadyScrapedIds)
  newOfferURLs <- offerURLs[ifUniqueOffer]
  
  return(newOfferURLs)
  
}
