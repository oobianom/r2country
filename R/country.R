#' Names of all countries
#'
#' Fetch the names of all countries
#'
#' @return Names of all countries in the globe
#'
#' @examples
#' # list all the countries
#' countries
#'
#' # list only 5 countries
#' countries[1:5]
#'
#' # create a dataset with all countries of the world
#' data.frame(ID = quickcode::number(length(countries)), Names = countries)
#'
#' @export
countries <- as.character(unique(data.pck.cntry$name))

#' Names of all countries in upper case
#'
#' Fetch the names of all countries in upper case
#'
#' @return Names of all countries in the globe in upper case
#'
#' @examples
#' # list all the countries
#' COUNTRIES
#'
#' # list only 5 countries
#' COUNTRIES[1:5]
#'
#' # create a dataset with all countries of the world
#' data.frame(ID = 1, Names = COUNTRIES)
#'
#' @export
COUNTRIES <- toupper(countries)


countries1 <- countries
names(countries1)= tolower(countries1)


