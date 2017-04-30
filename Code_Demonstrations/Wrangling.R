##Wrangling Analysis##
#Load flights.csv

flights <- read.csv("https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/flights.csv", 
                    header = TRUE, stringsAsFactors = FALSE)

flight.date <- flights$date

#find flights from May -- date looks like "____-05-__"
May.flights <- grep("(-05-)", flight.date, value = TRUE)

#find index of these flights
May.flights.indx <- grep("(-05-)", flight.date, value = FALSE)

#Keep only data for May flights
flights.May <- flights[May.flights.indx, ]


#Using the filter function
install.packages("magrittr")
library(magrittr)

install.packages("dplyr")
library(dplyr)

#Store May flights using filter
flights %>% filter(date %in% grep("(-05-)", flight.date, value = TRUE)) -> May.flights

#Store non-delays using filter
flights %>% filter(arr_delay <= 0 & dep_delay <= 0) -> no.delays

##select function
#Select all columns between arr_delay and dep_delay
flights %>% select(arr_delay : dep_delay) -> columns1


#Select all columns between date and arr
flights %>% select(date:arr) -> columns2

#Using the arrange() function

#Order (in descending order) according to cyl and then disp
arrange(mtcars, cyl, disp)

#Order flights by hour and then minute
flights %>% arrange(hour, minute) -> ordered.flights


#Examples of mutate()

#Add an average speed variable
flights %>% mutate(avg.speed = dist/time) -> new.data

#old way of doing this with cbind(
new.data2 <- cbind(flights, avg.speed = flights$dist / flights$time)
)