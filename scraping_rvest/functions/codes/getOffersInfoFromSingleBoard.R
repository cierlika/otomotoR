

getOffersInfoFromSingleBoard <- function(page, offersTable, sleep, timeout)
{
  
  options(stringsAsFactors = FALSE, timeout = timeout)
  
  alreadyScrapedOfferIds <- offersTable$Id
  offersTable <- createEmptyTable(columnNames = names(offersTable))
  newOfferURLs <- filterNewOfferURLs(page = page, alreadyScrapedIds = alreadyScrapedOfferIds, timeout = timeout)
  
  for(url in newOfferURLs)
  {
    singleOfferValues <- getSingleOffer(URL = url, sleep = sleep, timeout = timeout)
    offersTable <- rbind(offersTable, singleOfferValues)
  }
  
  return(offersTable)
}
