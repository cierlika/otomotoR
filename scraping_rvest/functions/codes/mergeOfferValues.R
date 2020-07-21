

mergeOfferValues <- 
  function(
    offerId,
    offerPrice,
    dealerType,
    dealerLocation,
    paramLabels,
    paramValues,
    equipmentLabels,
    description,
    readingTime,
    numberOfPhotos
  )
  {
    
    noOfRows <- length(paramLabels) + length(equipmentLabels) + length(c(description, offerId[1], dealerType, dealerLocation, offerPrice, readingTime, numberOfPhotos))
    noOfEquipmentRows <- length(equipmentLabels)
    
    singleOfferTable <- data.frame(
      Id = rep(offerId[2], noOfRows),
      Label = c(paramLabels, equipmentLabels, "Opis", "Data.oferty", "Sprzedawca", "Lokalizacja", "Czas.pobrania", "Liczba.zdjec" ,names(offerPrice)),
      Value = c(paramValues, rep(1, noOfEquipmentRows), description, offerId[1], dealerType, dealerLocation, readingTime, numberOfPhotos, offerPrice)
    )
    
    return(singleOfferTable)
    
  }



