#Input and Output

#saving an .RData file
x <- c(1, 2, 3, 4)
y <- x^2

#set current directory
dir <- getwd()
setwd(dir)

#save the variables x and y
save(x, y, file = "My_first_data.RData")

#re-load the data
rm(list = ls())

load(file = "My_first_data.RData")

##This will also work as an .rds file
save(x, y, file = "My_first_data.rds")

rm(list = ls())
load(file = "My_first_data.rds")


#Example of airport data
airports1 <- read.table(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/airports.csv",
                        sep = ",", header = FALSE)

#in airports1, we didn't account for the header / column names
#as a result, every value in the data frame was coerced to strings

airports2 <- read.table(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/airports.csv",
                        sep = ",", header = TRUE)

#again, the above forces all strings to be factors.

#to keep strings, run the following:
airports3 <- read.table(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/airports.csv",
                        sep = ",", header = TRUE, stringsAsFactors = FALSE)

#equivalently, we can use read.csv

airports4 <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/airports.csv",
                      header = TRUE, stringsAsFactors = FALSE)


##trying to run read.table on irregular / non-rectangular / unstructured data
email.trial <- read.table(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/USF_email.txt")

#the above didn't work because read.table expects rectangular data
#instead, we can use readLines() or read_lines() from the stringr library
email1 <- readLines("https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/USF_email.txt")

#equivalently, we can use read_lines()
library(tidyverse)
email2 <- read_lines("https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/USF_email.txt")


##printing to the console using print() or cat()
name <- "James D. Wilson"
print(name)

#concatenate strings using cat() -- note this is equivalent to str_c() from stringr
cat("My name is ", name, ".", sep = "")

#saving what is shown on the console to a file
cat("hello world", file = "hello_world.txt")

#add a line to the same file
cat("My name is James.", file = "hello_world.txt", append = TRUE)
readLines("hello_world.txt") #note this has no spaces or lines between the text

#if we want a new line, use \n

cat("hello world \n", file = "hello_world.txt")

#add a line to the same file
cat("My name is James. \n", file = "hello_world.txt", append = TRUE)

readLines("hello_world.txt")
