#' Fetch countries that start with specified characters
#'
#' Subset and return countries given a specified characters to search
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching a specified character
#'
#' @seealso [countryEndsWith()] for country search ending in specified character, and [countryHas()] for countries that contain specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that start with "A" or "a"
#' # note that the search in case-insensitive
#' countryStartsWith("A", full.list = FALSE)
#'
#' # task 2: get only names of countries that start with "No" or "no"
#' countryStartsWith("no", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryStartsWith("no")
#'
#' @export
countryStartsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[startsWith(tolower(data.pck.cntry$name),tolower(char)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}



#' Fetch countries that ends with specified characters
#'
#' Subset and return countries given a specified characters to search
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching a specified character
#'
#' @seealso [countryStartsWith()] for country search starting with specified characters, and [countryHas()] for countries that contain specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that end with "A" or "a"
#' # note that the search in case-insensitive
#' countryEndsWith("A", full.list = FALSE)
#'
#' # task 2: get only names of countries that end with "No" or "no"
#' countryEndsWith("no", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryEndsWith("no")
#'
#' @export
countryEndsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[endsWith(tolower(data.pck.cntry$name),tolower(char)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}



#' Fetch countries that contains with specified characters
#'
#' Subset to obtain data for countries containing specified characters to search
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching content from a specified character
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that contains with "ER" or "er"
#' # note that the search in case-insensitive
#' countryHas("er", full.list = FALSE)
#'
#' # task 2: get only names of countries that contains with "LAND" or "lAND" or "land"
#' countryHas("lAND", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryHas("many", full.list = TRUE)
#'
#' @export
countryHas <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[grep(tolower(char),tolower(data.pck.cntry$name)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}

#' Fetch countries data based on official language prefix
#'
#' Obtain country data matching language first one or more letters
#'
#' @param char character to search in languages
#' @param full.list whether to return only name of country or full list
#'
#' @return language list or country data list matching parts of a character search on languages
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only language names that ends with "EN" or "en"
#' # note that the search in case-insensitive
#' languageStartsWith("eN", full.list = FALSE)
#'
#' # task 2: get only language names that ends with "chi"
#' languageStartsWith("chi", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country with the language
#' languageStartsWith("sin", full.list = TRUE)
#'
#' # searching text with no results
#' languageStartsWith("er", full.list = FALSE)
#'
#' @export
languageStartsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[startsWith(tolower(data.pck.cntry$officiallanguage),tolower(char)),]
  dcntry <- dcntry[,c("name","officiallanguage")]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else rm.na(unique(unlist(dcntry$officiallanguage)))
  }else{
    # return nothing if empty
    return(NULL)
  }
}

rm.na <- function(var) var[!is.na(var)]

#' Fetch countries data with official language ending in specified character
#'
#' Obtain country data matching language first one or more letters
#'
#' @param char character to search in languages
#' @param full.list whether to return only name of country or full list
#'
#' @return language list or country data list matching parts of a character search on languages
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only language names that ends with "EN" or "en"
#' # note that the search in case-insensitive
#' languageEndsWith("eN", full.list = FALSE)
#'
#' # task 2: get only language names that ends with "chi"
#' languageEndsWith("chi", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country with the language
#' languageEndsWith("sin", full.list = TRUE)
#'
#' # searching text with no results
#' languageEndsWith("er", full.list = FALSE)
#'
#' @export
languageEndsWith <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[endsWith(tolower(data.pck.cntry$officiallanguage),tolower(char)),]
  dcntry <- dcntry[,c("name","officiallanguage")]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else rm.na(unique(unlist(dcntry$officiallanguage)))
  }else{
    # return nothing if empty
    return(NULL)
  }
}

#' Fetch countries data based on official language prefix
#'
#' Obtain country data matching language first one or more letters
#'
#' @param char character to search for
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching content from a specified character
#'
#' @seealso \code{\link{countryStartsWith}} for country search starting with specified characters, and [countryEndsWith()] for countries that end with a specified characters.
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that contains with "ER" or "er"
#' # note that the search in case-insensitive
#' countryHas("er", full.list = FALSE)
#'
#' # task 2: get only names of countries that contains with "LAND" or "lAND" or "land"
#' countryHas("lAND", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country
#' countryHas("many", full.list = TRUE)
#'
#' @export
languageHas <- function(char, full.list = TRUE){
  # filter data
  dcntry <- data.pck.cntry[grep(tolower(char),tolower(data.pck.cntry$officiallanguage)),]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}


#' Fetch countries by continent
#'
#' Obtain country data matching language first one or more letters
#'
#' @param name name of continent
#' @param full.list whether to return only name of country or full list
#'
#' @return country data list matching continent
#'
#' @details
#' Note that choices for names of continent includes 'asia','europe','africa','north america','south america','oceania'
#'
#'
#' @keywords NULL
#'
#' @examples
#' # task 1: get only names of countries that contains with "africa" or "AFrica"
#' # note that the search in case-insensitive
#' byContinent("africa", full.list = FALSE)
#'
#' # task 2: get only names of countries that contains with "ASIA" or "asia"
#' byContinent("asia", full.list = FALSE)
#'
#' # task 3: repeat task 2, but return full list for each country
#' byContinent("europe", full.list = TRUE)
#'
#' @export
byContinent <-function(name = c('asia','europe','africa','north america','south america','oceania'), full.list = TRUE){
  # match name of continent
  cnt.name <- match.arg(name)

  # filter data
  dcntry <- data.pck.cntry[grep(tolower(cnt.name),tolower(data.pck.cntry$continent)),c("name","continent")]
  if(nrow(dcntry)){
    # return results if > 0
    if(full.list) split(dcntry, seq(nrow(dcntry))) else unlist(dcntry$name)
  }else{
    # return nothing if empty
    return(NULL)
  }
}

