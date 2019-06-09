#' Looks up the most recent USD/EUR exchange rate and compute the provided USD amount in EUR (as a number)
#' @param x number of USD
#' @param decimals number of decimals for the exchange rate
#' @export
#' @return integer
#' @examples
#' convert_usd_to_eur(10)
#' convert_usd_to_eur(100)

convert_usd_to_eur <- function(usd, decimals = 3){
  rate <- eurusd(decimals)
  rate * usd
}
