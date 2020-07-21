
checkCorrectnessOfParamLabelsAndValues <- function(labels, values)
{
 
  response <- TRUE
   
  if(!is.vector(labels) || !is.character(labels))
  {
    message("Parameter labels object is not a character vector. The object looks like:\n", labels)
    response <- FALSE
  }
  
  if(!is.vector(values) || !is.character(values))
  {
    message("Parameter values object is not a character vector. The object looks like:\n", values)
    response <- FALSE
  }
  
  if(length(labels) != length(values))
  {
    message("Parameter labels and parameters values do not have equal length. \nThe legth of labels: ", length(labels), "\nThe length of values: ", length(values))
    response <- FALSE
  }
  
  return(response)
  
}