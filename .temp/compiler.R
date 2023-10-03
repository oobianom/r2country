library(tidyr)
library(dplyr)
library(magrittr)
library(readxl)
library(devtools)
country_population <- read_excel("inst/.temp/population.xlsx")
country_population<-country_population[,c(1,4)]
names(country_population) = c("ID",names(country_population)[-1])
country_population$ID=10000+c(1:nrow(country_population))


country_calling_code <- read_excel("inst/.temp/callingcode.xlsx")
country_calling_code<-country_calling_code[,c(1,3)]
country_calling_code$callingcode = gsub("\\.0","", as.character(country_calling_code$callingcode))
names(country_calling_code) = c("ID",names(country_calling_code)[-1])
country_calling_code$ID=10000+c(1:nrow(country_calling_code))


my_data <- read_excel("inst/.temp/money.xlsx")
country_names <- my_data
names(country_names) = c("ID",names(country_names)[-1])
country_names$ID=10000+c(1:nrow(country_names))
country_money <- country_names
country_money <- country_names[c(1,3,4,5,6)]
ppp <- country_names
country_names<-ppp[1:2]
country_language <- ppp[c(1,13)]


getcontinentcaptial <- readLines("inst/.temp/continentscapitals.txt")
tocsvcc <- data.frame(getcontinentcaptial) %>% group_by_all() %>%
  separate(getcontinentcaptial,c("continent","cntry","capital"),sep = " - ") %>%
  mutate(upcountry = toupper(cntry))
joincontinent <- country_names %>% mutate(upcountry = toupper(name))
joincontinent[joincontinent$upcountry == "CÔTE D'IVOIRE",]$upcountry = "COTEDVOICE"
joincontinent <- joincontinent%>% left_join(tocsvcc,by="upcountry")

joincontinent[joincontinent$upcountry == "TURKEY",]$continent = "Europe & Asia"
joincontinent[joincontinent$upcountry == "GEORGIA",]$continent = "Europe & Asia"
joincontinent[joincontinent$upcountry == "RUSSIA",]$continent = "Europe & Asia"
joincontinent[joincontinent$upcountry == "TURKMENISTAN",]$capital = "Aşgabat"
joincontinent[joincontinent$upcountry == "CAMEROON",]$capital = "Yaoundé"
joincontinent[joincontinent$upcountry == "BOLIVIA",]$capital = "Sucré"
joincontinent[joincontinent$upcountry == "BRAZIL",]$capital = "Brasília"
joincontinent[joincontinent$upcountry == "COLOMBIA",]$capital = "Bogotá"
joincontinent[joincontinent$upcountry == "COSTA RICA",]$capital = "San José"
joincontinent[joincontinent$upcountry == "PARAGUAY",]$capital = "Asunción"

country_continent <- joincontinent[,c("ID","continent")]
country_capital <- joincontinent[,c("ID","capital")]

my_time <- read_excel(".temp/time.xlsx")
my_time$Time <- trimws(my_time$Time)
newyorktime <- `attr<-`(as.POSIXct(Sys.time()), "tzone", "America/New_York")

timedata = as.Date(Sys.time())
my_time$Timen = gsub("Tue(.*)","0", my_time$Time)
my_time$Timen = gsub("Wed(.*)","24", my_time$Timen)
my_time$Time = gsub("Tue","2023-10-03", my_time$Time)
my_time$Time = gsub("Wed","2023-10-04", my_time$Time)
my_time$City = gsub(" \\*","",my_time$City)

gleeer<-function(x,add=0){
  dd = as.integer(unlist(strsplit(x,":")))
  dd[1] = dd[1]+add
  paste(dd,collapse = ":")
}

my_time2 <- as.data.frame(my_time %>% separate(Time,c("date","time","pmam"), remove = F, sep = " ")) %>% distinct(City, .keep_all = TRUE)
my_time2$ID <- 1:nrow(my_time2)
nytime <- as.character(my_time2[my_time2$City=="USA, New York, New York","Time"])
my_time3 <- my_time2 %>% ungroup() %>% group_by(ID)%>%
  mutate(timer1 = ifelse(tolower(pmam) == "pm",gleeer(time,12),gleeer(time)),
         timex3 = paste0(date," ",timer1,":00 EDT"),
         Timediff = as.numeric(difftime(timex3,nytime,units = "secs")),
         time6 = as.POSIXct(nytime) + Timediff

  )
city_time <- my_time3[,c("City","Timediff")]#,"Time")]


#city_duplicates <- city_time %>% group_by(City) %>% filter(n()>1) %>% ungroup() %>% arrange(City)



use_data(country_continent,overwrite = T)
use_data(country_capital,overwrite = T)
use_data(country_calling_code,overwrite = T)
use_data(country_population,overwrite = T)
use_data(city_time,overwrite = T)
use_data(country_names,overwrite = T)
use_data(country_money,overwrite = T)
use_data(country_language,overwrite = T)


#' #' Get country states
#' #'
#' #' Fetch all country states
#' #'
#' #' @rdname countryitems
#' #' @format NULL
#' #' @docType NULL
#' #' @keywords NULL
#' #' @export
#' getCTRY<-lapply(countries1,function(i){
#'   rlang::new_function(
#'     args = rlang::exprs(item = c("currency","language","callingcode","population"), as.of = 2023),
#'     rlang::expr({
#'       ctry.name = !!i
#'       item = match.arg(item)
#'       print(item)
#'       print("heelo")
#'     }),
#'     env = asNamespace("quickcode")
#'   )
#' })
