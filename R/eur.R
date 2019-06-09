#' Formats a number to a string using the Euro sign, rounding up to 2 digits and using the comma as the big.mark
#' @param amount amount to transform to €
#' @export
#' @return string
#' @examples
#' eur(675687)
#' eur(-8787876)
#' @seealso uneur()

eur <- function(amount){
  amount <- as.numeric(amount)
  input <- round(amount, 2)
  eur <- format(input, big.mark=",", scientific=FALSE)

  ifelse(input < 0,eur <- paste0('-€', substring(as.character(eur),2)), eur <- paste0('€', as.character(eur)))
  return(eur)
}

