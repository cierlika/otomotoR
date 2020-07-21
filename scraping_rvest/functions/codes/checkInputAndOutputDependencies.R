

checkInputAndOutputDependencies <- function(init.df, output.df)
{

  ifDeclaredOutputDfExistsInGlobEnv <- exists( output.df, envir = globalenv() ) 
  ifEqualInitAndOutput <- identical( x = init.df , y = output.df )  
  
  if( !globalenv()$metaData$ifFirstRun )
  {
    answer <- TRUE
    messageText <- paste0("Restart from ", globalenv()$metaData$pageNumber, ". page.")
  }
  else if( ifDeclaredOutputDfExistsInGlobEnv &  ifEqualInitAndOutput)
  {
    answer <- yesOrNoQuestion(question = paste0("Are you sure to add new records to the existing data frame ", output.df, "? (y/n): "))
    messageText <- "Run function with addition new rows to the existing data frame."
  }
  else if( ifDeclaredOutputDfExistsInGlobEnv & !ifEqualInitAndOutput )
  {
    message("Caution! Runnig function with different input and output data frame will cause overwrite existing data frame.")
    answer <- yesOrNoQuestion(question = "Are you still want to overwrite output data frame with new data? Please answer (y/n): ")
    messageText <- "The function will overwrite an existing data frame."
  }
  else if( !ifDeclaredOutputDfExistsInGlobEnv )
  {
    answer <- TRUE
    messageText <- "A new data frame will be created."
  }
  
  if( answer )
  {
    message( messageText )
  }
  else
  {
    stop("\r Function has been terminated by user.")
  }
  
  return( invisible() )
  
}

