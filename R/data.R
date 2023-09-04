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
#' @seealso \code{\link{country_names}} for linkage of IDs with country names
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
#' @format A data frame with the languages of countries
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


#' Data for Country Money
#'
#' Data for all country currency names and symbols
#'
#' @format A data frame with all countries and columns for currency
#' \describe{
#'    \item{x}{country name}
#'    }
#' @source {Internal data for currencies belonging to every country}
#'
#' @examples
#' data(country_calling_code)
#'

"country_calling_code"


#' Data for Country Money
#'
#' Data for all country currency names and symbols
#'
#' @format A data frame with all countries and columns for currency
#' \describe{
#'    \item{x}{country name}
#'    }
#' @source {Internal data for currencies belonging to every country}
#'
#' @examples
#' data(country_population)
#'

"country_population"



#' Data for Country Money
#'
#' Data for all country currency names and symbols
#'
#' @format A data frame with all countries and columns for currency
#' \describe{
#'    \item{x}{country name}
#'    }
#' @source {Internal data for currencies belonging to every country}
#'
#' @examples
#' data(country_continent)
#'

"country_continent"


#' Data for Country Money
#'
#' Data for all country currency names and symbols
#'
#' @format A data frame with all countries and columns for currency
#' \describe{
#'    \item{x}{country name}
#'    }
#' @source {Internal data for currencies belonging to every country}
#'
#' @examples
#' data(country_capital)
#'

"country_capital"
