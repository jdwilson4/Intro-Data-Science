##Functions 3

#saving to a variable vs. printing to screen

sum.function <- function(x, y){
  value <- x + y
  return(value)
}
x <- 1:10
y <- 11:20
#print to screen
sum.function(x, y)

#storing for later use (to your environment)
result <- sum.function(x, y)


sum.function2 <- function(x, y){
  value1 <- x + y #sum
  value2 <- sd(x)
  value3 <- sd(y)
  value4 <- sd(value1)
  result <- list(sum = value1, sdx = value2, sdy = value3,
                 sd.sum = value4)
  #return(result)
}

sum.function2(x, y)

result2 <- sum.function2(x, y)

#Key point about return - if it is not used, then the 
#last value saved in the function will be returned


##De-bugging
#first note that we cannot add a character to a numeric
"Mystring" + 99

#build a function which calls many functions

func1 <- function(arg_1) func2(arg_1)
func2 <- function(arg_2) func3(arg_2)
func3 <- function(arg_3) func4(arg_3)
func4 <- function(arg_4) "Mystring" + arg_4

func1(99) #in essence will pass 99 through 4 functions and
#at the end try to add 99 with "Mystring"


##Using try() function

func5 <- function(x, y){
  try(log(x + y)) #we know that log() does not work for negative values
  temp <- x + y
  return(temp)
}

func5(-3, -2)

#note the above will still work as a warning only is thrown
func6 <- function(x, y){
  log(x + y) #we know that log() does not work for negative values
  temp <- x + y
  return(temp)
}

#however, it won't work with characters

func6 <- function(x, y){
  log(x + y) #we know that log() does not work for negative values
  temp <- as.numeric(x) + as.numeric(y)
  return(temp)
}

#throws an error and we do not complete the function
func6("3", 2)

#fix by using try()
func7 <- function(x, y){
  try(log(x + y)) #we know that log() does not work for negative values
  temp <- as.numeric(x) + as.numeric(y)
  return(temp)
}

func7("3", 2)


##Trying the tryCatch() function
show.condition <- function(code){
  tryCatch(code, 
           error = function(x){
             y <<- x
           })
}

show.condition(stop("!"))


#Using the stop() or warning() functions for defensive programming

##Example - concocted by Hai: creating a vector of strings where two strings match

string.match <- function(string1, string2){
  #Input: string1 and string2 are vectors of strings of the same length
  #Output: same.string - vector containing all strings where string1 and string2 match
  
  #check that both vectors are character types
  if(is.character(string1) == FALSE | is.character(string2) == FALSE){
    stop("string1 and string2 must both be character vectors!")
  }
  
  #check that both vectors are the same length
  if(length(string1) != length(string2)){
    stop("string1 and string2 must be of the same length!")
  }
  logical.same <- string1 == string2
  same.string <- string1[logical.same]
  return(same.string)
}

string.1 <- c("I", "like", "Duke", "basketball")
string.2 <- c("I", "like", "UNC", "basketball")
  
string.same <- string.match(string.1, string.2)
