

checkCorrectnessOfOfferValues <- 
  function(
    offerId,
    offerPrice,
    dealerType,
    dealerLocation,
    paramLabels,
    paramValues,
    equipmentLabels,
    description,
    photos
  )
  {
    ifCorrectOfferId <- checkCorrectnessOfOfferId(offerId = offerId)
    ifCorrectOfferPrice <- checkCorrectnessOfOfferPrice(offerPrice = offerPrice)
    ifCorrectDealerType <- checkCorrectnessOfDealerType(dealerType = dealerType)
    ifCorrectDealerLocation <- checkCorrectnessOfDealerLocation(dealerLocation = dealerLocation)
    ifCorrectParamLabelsAndValues <- checkCorrectnessOfParamLabelsAndValues(labels = paramLabels, values = paramValues)
    ifCorrectEquipmentLabels <- checkCorrectnessOfEquipmentLabels(equipment = equipmentLabels)
    ifCorrectDescription <- checkCorrectnessOfDescription(description = description)
    ifCorrectPhotos <- checkCorrectnessOfPhotos(photos = photos)
    
    howManyCorrectValues <- eval(parse(text = paste0("sum(", paste0(ls(envir = environment(), pattern = "^ifCorrect"), collapse = ","), ")")))
    maxNumberOfCorrectValues <- length(ls(envir = environment(), pattern = "^ifCorrect"))
    
    ifAllTrueAnswers <- howManyCorrectValues == maxNumberOfCorrectValues
    
    return(ifAllTrueAnswers)
  }
