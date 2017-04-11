##Creating a function that removes extraneous spaces

rm_space <- function(myString){
  if(class(myString) != "character"){
    stop("Please provide a string!")
  }
  temp <- strsplit(myString, " +") #separate on all spaces (one or more)
  result <- paste(temp[[1]], collapse = " ") #recombine into a single string with 1 space
  return(result)
}

#Example
myString <- "I    enjoy     reading books"

rm_space(myString)


#Example with a number
myString <- c(2, 3)
rm_space(myString)


###Example using the Airports data
airports <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/airports.csv", 
                     header = TRUE, stringsAsFactors = FALSE)

airport.name <- airports$airport

#Identify airports starting with "Ba"
indices <- grep("^Ba", airport.name)
names <- grep("^Ba", airport.name, value = TRUE)

#Trying with brackets
names2 <- grep("^[B][a]", airport.name, value = TRUE) #same as above
names3 <- grep("^[B]^[a]", airport.name, value = TRUE) #not possible, cannot start with both a "B" and an "a"

#Identify airports that end in "al" 
names4 <- grep("(al)$", airport.name, value = TRUE)

#Logical vector with airports starting with "Ba"
logical.indx <- grepl("^Ba", airport.name)
