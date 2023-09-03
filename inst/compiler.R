library(tidyr)
library(dplyr)
library(magrittr)
library(readxl)
library(devtools)
country_population <- read_excel("inst/population.xlsx")
country_population<-country_population[,c(1,4)]
names(country_population) = c("ID",names(country_population)[-1])
country_population$ID=10000+c(1:nrow(country_population))


country_calling_code <- read_excel("inst/callingcode.xlsx")
country_calling_code<-country_calling_code[,c(1,3)]
country_calling_code$callingcode = gsub("\\.0","", as.character(country_calling_code$callingcode))
names(country_calling_code) = c("ID",names(country_calling_code)[-1])
country_calling_code$ID=10000+c(1:nrow(country_calling_code))


my_data <- read_excel("inst/money.xlsx")
country_names <- my_data
names(country_names) = c("ID",names(country_names)[-1])
country_names$ID=10000+c(1:nrow(country_names))
country_money <- country_names
country_money <- country_names[c(1,3,4,5,6)]
ppp <- country_names
country_names<-ppp[1:2]
country_language <- ppp[c(1,13)]


getcontinentcaptial <- readLines("inst/continentscapitals.txt")
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

my_time <- read_excel("inst/time.xlsx")
newyorktime <- `attr<-`(as.POSIXct(Sys.time()), "tzone", "America/New_York")

timedata = as.Date(Sys.time())
my_time$Timen = gsub("Thu(.*)","0", my_time$Time)
my_time$Timen = gsub("Fri(.*)","24", my_time$Timen)
my_time$Time = gsub("Thu","2023-08-31", my_time$Time)
my_time$Time = gsub("Fri","2023-09-1", my_time$Time)
my_time$City = gsub(" \\*","",my_time$City)

gleeer<-function(x,add=0){
  dd = as.integer(unlist(strsplit(x,":")))
  dd[1] = dd[1]+add
  paste(dd,collapse = ":")
}
my_time2 <- as.data.frame(my_time %>% separate(Time,c("date","time","pmam"), remove = F, sep = " "))
my_time2$ID <- 1:nrow(my_time2)
nytime <- as.character(my_time2[my_time2$City=="New York","Time"])
my_time3 <- my_time2 %>% group_by(ID)%>%
  mutate(timer1 = ifelse(tolower(pmam) == "pm",gleeer(time,12),gleeer(time)),
         Timediff = as.numeric(difftime(Time,nytime,units = "secs")),
         time6 = as.POSIXct(nytime) + Timediff

  )
city_time <- my_time3[,c("City","Timediff")]#,"Time")]


city_duplicates <- city_time %>% group_by(City) %>% filter(n()>1) %>% ungroup() %>% arrange(City)

city_time[city_time$City == "Albany"&city_time$Timediff == 0,]$City = "Albany, New York"
city_time[city_time$City == "Albany"&city_time$Timediff == 90840,]$City = "Albany, Oregon"

city_time[city_time$City == "Alexandria"&city_time$Timediff == -18120,]$City = "Alexandria, Egypt"
city_time[city_time$City == "Alexandria"&city_time$Timediff == 0,]$City = "Alexandria, Virginia"

city_time[city_time$City == "Athens"&city_time$Timediff == -17580,]$City = "Athens, Greece"
city_time[city_time$City == "Athens"&city_time$Timediff == 0,]$City = "Athens, Georgia"

city_time[city_time$City == "Birmingham"&city_time$Timediff == -24780,]$City = "Birmingham, UK"
city_time[city_time$City == "Birmingham"&city_time$Timediff == -3600,]$City = "Birmingham, Alabama"

city_time[city_time$City == "Cambridge"&city_time$Timediff == 62040,]$City = "Cambridge, New Zealand"
city_time[city_time$City == "Cambridge"&city_time$Timediff == 0,]$City = "Cambridge, Ontario"

city_time[city_time$City == "Córdoba"&city_time$Timediff == -21180,]$City = "Córdoba, Spain"
city_time[city_time$City == "Córdoba"&city_time$Timediff == 4320,]$City = "Córdoba, Argentina"

city_time[city_time$City == "Hagåtña"&city_time$Timediff == 50400,]$City = "Hagåtña, Guam"

city_time[city_time$City == "Hilo"&city_time$Timediff == -21600,]$City = "Hilo, Hawaii"


city_time[city_time$City == "Honolulu"&city_time$Timediff == -21600,]$City = "Honolulu, Hawaii"
city_time[city_time$City == "Honolulu"&city_time$Timediff == -17160,]$City = "Honolulu, Central Finland"

city_time[city_time$City == "Istanbul"&city_time$Timediff == -17760,]$City = "Istanbul, Turkey"


city_time[city_time$City == "Lincoln"&city_time$Timediff == -24780,]$City = "Lincoln, England"
city_time[city_time$City == "Lincoln"&city_time$Timediff == -3600,]$City = "Lincoln, California"


city_time[city_time$City == "London"&city_time$Timediff == -24780,]$City = "London, United Kingdom"
city_time[city_time$City == "London"&city_time$Timediff == 0,]$City = "London, Ontario"

city_time[city_time$City == "Naples"&city_time$Timediff == -21180,]$City = "Naples, Italy"
city_time[city_time$City == "Naples"&city_time$Timediff == 0,]$City = "Naples, Florida"

city_time[city_time$City == "Nicosia"&city_time$Timediff == -17760,]$City = "Nicosia, Cyprus"
#city_time[city_time$City == "Nicosia"&city_time$Timediff == -17580,]$City = "Nicosia, Florida"

city_time[city_time$City == "Orange"&city_time$Timediff == -10800,]$City = "Orange, California"
city_time[city_time$City == "Orange"&city_time$Timediff == 54840,]$City = "Orange, NS Wales"


city_time[city_time$City == "Riverside"&city_time$Timediff == -10800,]$City = "Riverside, California"
city_time[city_time$City == "Riverside"&city_time$Timediff == 0,]$City = "Riverside, Ohio"

city_time[city_time$City == "Saint-Pierre"&city_time$Timediff == -14520,]$City = "Saint-Pierre, Reunion"
city_time[city_time$City == "Saint-Pierre"&city_time$Timediff == -36000,]$City = "Saint-Pierre, Miquelon"

city_time[city_time$City == "Saipan"&city_time$Timediff == 50400,]$City = "Saipan, Northern Marina Island"
#city_time[city_time$City == "Saipan"&city_time$Timediff == 54840,]$City = "Saipan, Ohio"


city_time[city_time$City == "San Juan"&city_time$Timediff == 0,]$City = "San Juan, Puerto Rico"
city_time[city_time$City == "San Juan"&city_time$Timediff == 4320,]$City = "San Juan, Argentina"


city_time[city_time$City == "Santa Fe"&city_time$Timediff == -7200,]$City = "Santa Fe, New Mexico"
city_time[city_time$City == "Santa Fe"&city_time$Timediff == 4320,]$City = "Santa Fe, Argentina"

city_time[city_time$City == "Santa Rosa"&city_time$Timediff == -10800,]$City = "Santa Rosa, California"
city_time[city_time$City == "Santa Rosa"&city_time$Timediff == 4320,]$City = "Santa Rosa, Argentina"

city_time[city_time$City == "Santo Domingo"&city_time$Timediff == -2880,]$City = "Santo Domingo, Mexico"
city_time[city_time$City == "Santo Domingo"&city_time$Timediff == 0,]$City = "Santo Domingo, Puerto Rico"

city_time[city_time$City == "Tbilisi"&city_time$Timediff == -14160,]$City = "Tbilisi, Georgia"

city_time[city_time$City == "Victoria"&city_time$Timediff == -14520,]$City = "Victoria, Seychelles"
city_time[city_time$City == "Victoria"&city_time$Timediff == -10800,]$City = "Victoria, British Columbia"


city_time[city_time$City == "Wailuku"&city_time$Timediff == -21600,]$City = "Wailuku, Hawaii"

city_time[city_time$City == "Wake Island"&city_time$Timediff == 62040,]$City = "Wake Island, US Out Island"

city_time[city_time$City == "Worcester"&city_time$Timediff == 0,]$City = "Worcester, Massachusetts"
city_time[city_time$City == "Worcester"&city_time$Timediff == -21720,]$City = "Worcester, South Africa"

city_time[city_time$City == "Yerevan"&city_time$Timediff == -14160,]$City = "Yerevan, Armenia"
city_time[city_time$City == "Yerevan"&city_time$Timediff == -13980,]$City = "Yerevan, Azerbaijan"




use_data(country_continent,overwrite = T)
use_data(country_capital,overwrite = T)
use_data(country_calling_code,overwrite = T)
use_data(country_population,overwrite = T)
use_data(city_time,overwrite = T)
use_data(country_names,overwrite = T)
use_data(country_money,overwrite = T)
use_data(country_language,overwrite = T)
