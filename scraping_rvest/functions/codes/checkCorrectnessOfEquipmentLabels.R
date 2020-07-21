
checkCorrectnessOfEquipmentLabels <- function(equipment)
{
  response <- TRUE
  if(!is.vector(equipment) || !is.character(equipment))
  {
    message("Equipment object is not a character vector. The object looks like:\n", equipment)
    # response <- FALSE
  }
  
  return(response)
  
}

