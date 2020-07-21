

transformOfferDate <- function(offerDate)
{
  
  excludedTime <- gsub(pattern = "^.+, ", replacement = "", x = offerDate)
  day <- gsub(pattern = " \\w+ \\d{4}$", replacement = "", x = excludedTime)
  day <- ifelse(nchar(day)==1, paste0("0", day), day)
  month <- transformMonthName(date = excludedTime)
  year <- gsub(pattern = "^\\d+ \\w+ ", replacement = "", x = excludedTime)
  
  formattedOfferDate <- paste(year, month, day, sep = "-")
  
  return(formattedOfferDate)
  
}

