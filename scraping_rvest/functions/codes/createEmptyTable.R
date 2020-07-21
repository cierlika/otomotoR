
createEmptyTable <- function(columnNames)
{
  emptyTable <- data.frame(matrix(nrow = 0, ncol = length(columnNames)))
  names(emptyTable) <- columnNames
  return(emptyTable)
}
