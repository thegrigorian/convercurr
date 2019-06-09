#' Takes two arguments (date_from and date_to) and returns a data.table object on the daily rates from date_from to the date_to dates provided with 2 columns (date and exchange rate)
#' @param date_from starting date of the period, back-filled for missing dates
#' @param date_to ending date of the period, back-filled for missing dates
#' @param decimals number of decimals to show
#' @export
#' @return integer
#' @import httr
#'
#' @import lubridate
#' @import logger
#' @import data.table
#'

#' @examples
#' eurusds('2019-01-01', '2019-01-10')
#' eurusds('2018-02-01', '2018-02-10')

eurusds <- function(date_from, date_to, decimals = 3){
  date_from <- ymd(date_from)
  date_to <- ymd(date_to)
  dates_good <- date_from < date_to

  if(dates_good==FALSE){
    log_info('The start date was later than the end date... exit the function')
    stop()
  }

  if(date_from > Sys.Date()){
    log_info('The start date is in the future... exit the function')
    stop()
  }

  if(date_to > Sys.Date()){
    log_info('End date is in the future... resetting to today')
    date_to <- Sys.Date()
  }


  response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = date_from - 30,
      end_at   = date_to,
      base     = 'USD',
      symbols  = 'EUR'
    ))

  exchange_rates <- content(response)$rates
  output <- data.table(
    date = as.Date(names(exchange_rates)),
    eurusd = round(as.numeric(unlist(exchange_rates)), decimals))
  output <- output[order(date)]
  output <- output[date >= date_from & date <= date_to]
  return(output)

}
