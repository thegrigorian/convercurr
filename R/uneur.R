#' Formats a string  to a number.
#' @param amount amount to format to number
#' @export
#' @return string
#' @examples
#' eur("€6,565,757")
#' eur("-€177,343")
#' @seealso uneur()

uneur <- function(amount){
  input = substring(amount,1,1)
  if(input=="-") {number <- as.numeric(gsub(",","", substring(amount,3)))
  } else {number <- as.numeric(gsub(",","", substring(amount,2)))}
  return(number)
}

