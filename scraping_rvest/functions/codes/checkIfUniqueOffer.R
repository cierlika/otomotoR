

checkIfUniqueOffer <- function(newIds = offerIds, alreadyScrapedIds)
{
  ifUniqueId <- !(newIds %in% alreadyScrapedIds)
  return(ifUniqueId)
  
}

