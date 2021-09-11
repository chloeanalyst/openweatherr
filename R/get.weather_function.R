#' OpenWeatherMapR
#'
#' Returns weather metrics for specified Location and Date Range from the Open Weather Map API
#'
#' This is a descriptions
#' desctiptions
#' blah blah blah
#'
#'
#' @param key string Your Open Weather Map API key.
#' @param location City name eg: Manchester.
#' @param date Date range: today, yesterday, last5days, "2021-07-01" or list of dates example - list("2021-07,01","2021-07-02")
#'
#' @author Chloe Morgan
#'
#' @import httr
#' @import jsonlite
#' @import data.table
#' @import anytime
#' @import dplyr
#'
#' @return Table containing weather information.
#' @export
#'
#' @examples
#' \dontrun{
#' get.weather("APIKEY", Manchester,today)
#' get.weather("APIKEY", Manchester, "2021-07-01")
#' }


get.weather <- function(key,lat,lon,daterange){

  result <- list()

  for (i in daterange){

    result[[i]] <- setup.weather(key,lat,lon,i)

  }

  result <- as.data.frame(do.call(rbind,result)) %>% arrange(desc(date))

  return(result)

}
