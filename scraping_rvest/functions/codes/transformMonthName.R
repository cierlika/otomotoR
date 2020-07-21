
transformMonthName <- function(date)
{
  
  monthNames <- c("stycznia", "lutego", "marca", "kwietnia", "maja", "czerwca", "lipca", "sierpnia", "września", "października", "listopada", "grudnia")
  monthNumbers <- c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12")
  
  givenMonthName <- gsub(pattern = "\\s|\\d", replacement = "", x = date, ignore.case = T)
  ifGivenMonth <- monthNames==givenMonthName
  givenMonthNumber <- monthNumbers[ifGivenMonth]
  
  return(givenMonthNumber)
  
}
