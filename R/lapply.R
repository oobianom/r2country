#' @export
languageOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$officiallanguage)
})

#' @export
capitalOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$capital)
})

#' @export
populationOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$population2023)
})

#' @export
callingCodeOf <- lapply(countries1, function(cnt){
  paste0("+",unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$callingcode))
})

#' @export
currencyOf <- lapply(countries1, function(cnt){
  dcntry <- data.pck.cntry[data.pck.cntry$name==cnt,c("currency","symbol","isocode","fractionalunity")]
  if(nrow(dcntry)) unlist(dcntry) else NULL
})


city_time1 <- unlist(unique(city_time$City))
names(city_time1) <- city_time1

#' @export
timeOf <- lapply(city_time1, function(cnt){
  #message("!!! does not take daylight savings into account yet")
  us.time <- as.POSIXct(Sys.time(), tz = "America/New_York")
  as.POSIXct(as.numeric(unlist(city_time[city_time$City == cnt,]$Timediff)[1]) + us.time)
})


#' @export
continentOf <- lapply(countries1, function(cnt){
  unlist(data.pck.cntry[data.pck.cntry$name==cnt,]$continent)
})

