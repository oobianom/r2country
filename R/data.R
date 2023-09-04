#' Dataset for Country Currencies
#'
#' Data for all country currency names and symbols
#'
#' @docType data
#' @usage data(country_money)
#' @format A data frame with all countries and columns for currency
#' \describe{
#'    \item{ID}{Identifier for countries}
#'    \item{currency}{name of the currency}
#'    \item{symbol}{symbol of the currency}
#'    \item{isocode}{The ISO code of the currency}
#'    \item{fractionalunity}{The fractional unit of the currency}
#'    }
#' @source {Internal data for currencies belonging to every country}
#' @return data for currencies by country
#' @references \url{wikipedia.com}
#' @seealso \code{\link{country_names}} for linkage of IDs with country names
#' @keywords country currencies, currency by country
#' @examples
#' data(country_money)
#'
#' # view content of the countries currency
#' head(country_money)
#'
"country_money"



#' Dataset of country names
#'
#' Data for all country currency names and associated ID
#'
#' @docType data
#' @usage data(country_names)
#' @format A data frame with the names of all countries
#' \describe{
#'    \item{ID}{Identifier for the countries}
#'    \item{name}{name of the countries}
#'    }
#' @source {Internal data consisting of all country names}
#' @return data for names of country
#' @references \url{wikipedia.com}
#' @keywords country names
#' @examples
#' # load the country names
#' data(country_names)
#'
#' # view content of the countries currency
#' head(country_names)
#'

"country_names"



#' Dataset of country official languages
#'
#' Data for all countries and their associated languages
#'
#' @docType data
#' @usage data(country_language)
#' @format A data frame with the languages of countries
#' \describe{
#'    \item{ID}{Identifier for the countries}
#'    \item{officiallanguage}{official languages of countries}
#'    }
#' @source {Internal data consisting of all country IDs and their official languages}
#' @return country ID and official languages
#' @references \url{wikipedia.com}
#' @keywords country languages, language of countries
#' @seealso Data \code{\link{country_names}} for linkage of IDs with country names
#' @examples
#' # load the country ID and languages
#' data(country_language)
#'
#' # view content of the countries languages
#' head(country_language)
#'

"country_language"


#' Dataset of current time in Cities
#'
#' Dataset containing time different in various cities with respect to USA/New York time
#'
#' @docType data
#' @usage data(city_time)
#' @format A data frame with the current time in various cities
#' \describe{
#'    \item{City}{Names of cities}
#'    \item{Timediff}{Time difference relative to New York time}
#'    }
#' @source {Internal data consisting of cities and their corresponding time}
#' @return cities and the current time relative to New York
#' @references \url{timeanddate.com}
#' @keywords city time, current time in place, current time country
#' @examples
#' # load the cities and languages dataset
#' data(city_time)
#'
#' # view content of the city-language data
#' head(city_time)
#'

"city_time"


#' Dataset of countries and their calling code
#'
#' Dataset containing country IDs and their calling code
#'
#' @docType data
#' @usage data(country_calling_code)
#' @format A data frame with the calling code of countries
#' \describe{
#'    \item{ID}{country identifiers}
#'    \item{callingcode}{Calling code of countries}
#'    }
#' @source {Internal data consisting of countries and their calling code}
#' @return calling code of countries
#' @references \url{timeanddate.com}
#' @keywords country, country calling code, calling code
#' @seealso Data \code{\link{country_names}} for linkage of IDs with country calling code
#' @examples
#' # load the calling code dataset
#' data(country_calling_code)
#'
#' # view content of the city-calling code data
#' head(country_calling_code)
#'
#'

"country_calling_code"


#' Dataset of countries and their latest population
#'
#' Dataset containing country IDs and their population by year
#'
#' @docType data
#' @usage data(country_population)
#' @format A data frame with the population of countries
#' \describe{
#'    \item{ID}{country identifiers}
#'    \item{population2023}{country population as of 2023}
#'    }
#' @source {Internal data consisting of countries and their population}
#' @return corresponding population size of countries
#' @references \url{wikipedia.com}
#' @keywords country population, population of, population glocally
#' @seealso Data \code{\link{country_names}} for linkage of IDs with country population size
#' @examples
#' # load the population dataset
#' data(country_population)
#' data(country_names)
#' finaldb <- cbind(country_names,country_population)
#'
#' # view content of the country and population
#' head(finaldb)
#'
#'

"country_population"



#' Dataset of countries and their continents
#'
#' Dataset containing country IDs and their continents
#'
#' @docType data
#' @usage data(country_continent)
#' @format A data frame with the continents that countries belong to
#' \describe{
#'    \item{ID}{country identifiers}
#'    \item{continent}{continents of various country}
#'    }
#' @source {Internal data consisting of countries and their continent}
#' @return corresponding continents of countries
#' @references \url{wikipedia.com}
#' @keywords country continent, continents
#' @seealso Data \code{\link{country_names}} for linkage of IDs with continent
#' @examples
#' # load the population dataset
#' data(country_continent)
#' data(country_names)
#' finaldb <- cbind(country_names,country_continent)
#'
#' # view content of the country and population
#' head(finaldb)
#'
#'

"country_continent"


#' Dataset of countries and their capitals
#'
#' Dataset containing country IDs and their capitals
#'
#' @docType data
#' @usage data(country_capital)
#' @format A data frame with the capitals that countries belong to
#' \describe{
#'    \item{ID}{country identifiers}
#'    \item{capital}{capitals of various country}
#'    }
#' @source {Internal data consisting of countries and their capital}
#' @return corresponding capitals of countries
#' @references \url{wikipedia.com}
#' @keywords country capital, capitals
#' @seealso Data \code{\link{country_names}} for linkage of IDs with capital
#' @examples
#' # load the population dataset
#' data(country_capital)
#' data(country_names)
#' finaldb <- cbind(country_names,country_capital)
#'
#' # view content of the country and population
#' head(finaldb)
#'
#'

"country_capital"
