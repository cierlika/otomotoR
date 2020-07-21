
getSingleOffer <- function(URL, sleep = 10L, timeout)
{
  
  options(stringsAsFactors = FALSE, timeout = timeout)
  
  cat("Read offer from web adress:", URL, "\n")
  
  offerPage <- goToPage(URL = URL, timeout = timeout)
  
  offerId <-              getOfferId(page = offerPage, timeout = timeout)
  offerPrice <-           getOfferPrice(page = offerPage, timeout = timeout)
  dealerType <-           getDealerType(page = offerPage, timeout = timeout)
  dealerLocation <-       getDealerLoacation(page = offerPage, timeout = timeout)
  offerParametersTable <- getOfferParamTable(page = offerPage, timeout = timeout)
  offerParameterLabels <- getOfferParamLabels(paramElement = offerParametersTable, timeout = timeout)
  offerParameterValues <- getOfferParamValues(paramElement = offerParametersTable, timeout = timeout)
  offerEquipment <-       getOfferEquipmentLabels(page = offerPage, timeout = timeout)
  offerDescription <-     getOfferDescription(page = offerPage, timeout = timeout)
  offerReadingTime <-     as.character( Sys.time() )
  noOfPhotos <- getNumberOfPhotos(page = offerPage)
  
  ifAllValuesAreCorrect <- checkCorrectnessOfOfferValues(offerId = offerId,
                                offerPrice = offerPrice,
                                dealerType = dealerType,
                                dealerLocation = dealerLocation,
                                paramLabels = offerParameterLabels, 
                                paramValues = offerParameterValues, 
                                equipmentLabels = offerEquipment, 
                                description = offerDescription,
                                photos = noOfPhotos)
  
  tableWithOfferValues <- NULL
  if(ifAllValuesAreCorrect)
  {
    tableWithOfferValues <- mergeOfferValues(offerId = offerId,
                                             offerPrice = offerPrice,
                                             dealerType = dealerType,
                                             dealerLocation = dealerLocation,
                                             paramLabels = offerParameterLabels, 
                                             paramValues = offerParameterValues, 
                                             equipmentLabels = offerEquipment, 
                                             description = offerDescription,
                                             readingTime = offerReadingTime,
                                             numberOfPhotos = noOfPhotos)
  }
  
  Sys.sleep(sleep)
  
  return(tableWithOfferValues)
  
}
