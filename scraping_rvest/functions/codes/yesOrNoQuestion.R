

yesOrNoQuestion <- function(question)
{
  answer <- NA
  while(!(answer %in% c("y", "Y", "yes", "Yes", "YES", "n", "N", "no", "No", "NO")))
  {
    answer <- readline(prompt = question)
    if( !(answer %in% c("y", "Y", "yes", "Yes", "YES", "n", "N", "no", "No", "NO")) )
    {
      message("Please answer yes (y) or no (n).")
    }
  }
  
  answer.logical <- ifelse(answer %in% c("y", "Y", "yes", "Yes", "YES"), TRUE, FALSE)
  
  return(answer.logical)
  
}
