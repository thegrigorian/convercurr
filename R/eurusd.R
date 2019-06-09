#' Looks up the most recent USD/EUR exchange rate via an API call and returns the rate as a number.
#' @param decimals number of decimals to show
#' @export
#' @return integer
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom data.table data.table
#' @importFrom data.table setkey
#' @importFrom lubridate ymd
#' @importFrom logger log_info
#' @examples
#' eurusd()
#' eurusd(2)

eurusd <- function(decimals = 3){
  response <- GET('https://api.exchangeratesapi.io/latest?base=USD')
  exchange_rates <- content(response)
  round(exchange_rates$rates$EUR, decimals)
}
