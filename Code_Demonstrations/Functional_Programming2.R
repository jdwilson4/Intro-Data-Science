###Titanic.csv lab study

data <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/titanic.csv", header = TRUE)

str(data)


#Part 1: two if statements and a for loop
temp <- data$Survived
#arbitrarily storing a vector the same length as temp
survived <- temp
for(i in 1:length(temp)){
  if(temp[i] == 1){
    survived[i] <- "Survived"
    }
  if(temp[i] == 0){
    survived[i] <- "Perished"
  }
}

#Part 1: if else
survived2 <- temp
#check that temp only has 0s and 1s
unique(temp)
for(i in 1:length(temp)){
  if(temp[i] == 1){
    survived2[i] <- "Survived"
  }else{
    survived2[i] <- "Perished"
  }
}

#subsetting
survived3 <- as.character(temp)
survived3[survived3 == "1"] <- "Survived"
survived3[survived3 == "0"] <- "Perished"

#ifelse()
survived4 <- temp
survived4 <- ifelse(survived4 == 1, "Survived", "Perished")
survived4 == survived

##Part 2: change age to "Minor", "Adult," and "Senior"
temp <- data$Age
summary(temp)

#Subsetting
Age.class <- temp
Age.class[temp < 18] <- "Minor"
Age.class[temp >= 18 & temp < 65] <- "Adult"
Age.class[temp >= 65] <- "Senior"

table(Age.class)

#ifelse() 
Age.class2 <- ifelse(temp < 18, "Minor", 
                     ifelse(temp >= 18 & temp < 65, "Adult", "Senior"))

#check whether each entry is an NA
is.na(Age.class2)

##Part 4: Print First Class, Business, or Economy
temp <- data$Pclass
unique(temp)

#temp <- as.character(temp)

for(i in 1:length(temp)){
  print(switch(as.character(temp[i]),
         "1" = "First Class",
         "2" = "Business",
         "3" = "Economy"))
}

#simple function for drawing rows a through b
row.func <- function(a, b){
  mtcars[a:b, ]
}

row.func(1, 3)
row.func(3, 10)
row.func(-1, 3)

#Part 2
squares.func <- function(x){
  y <- x^2
  result <- data.frame(x, y)
  result[1:10, ]
}
x <- 1:15
squares.func(x)

#Part 3
squares.and.replace.func <- function(x){
  y <- x^2
  x <<- data.frame(x, y) #global assignment
}

x <- 1:15
z <- squares.and.replace.func(x)

##showing that we cannot find a value

rm(list = ls())
my_func_02 <- function(){
  y <- 2
  c(x,y)
}
my_func_02()
x <- 1
my_func_02()

x <- 1
myFunc_03 <- function(){
  x <- 1000
  y <- 2
  myFunc_04 <- function(){
    x <- 99
    z <- 3
    c(x,y,z)
  }
  myFunc_04()
}

myFunc_03()
myFunc_04

###3/28/17###
?plot

#Default arguments
my_Func_12 <- function(a = 1, b = 2){
  c(a, b)
}

my_Func_12(3)
my_Func_12()

#Default arguments with logicals
my.logical.function <- function(a = 2, ind = TRUE){
  if(ind == TRUE){
    print(a*2)
  }
  if(ind == FALSE){
    print(a*4)}
}

my.logical.function(a = 4)
my.logical.function(a = 4, ind = FALSE)

#playing around with missing()
my.missing.fun <- function(arg1 = 2){
  missing(arg1)
}

my.missing.fun()

my.missing.fun <- function(arg1){
  j <- 0
  for(i in 1:10000000000){
    j <- i + j 
  }
  print(j + arg1)
  #missing(arg1)
}


my.fun <- function(x){
  print(x+3)
}

my.fun.ls <- function(a = ls()){
  z <- 10
  a
}

my.fun.ls <- function(a = ls(), g = 2){
  z <- 10
  a
}


my.fun.return <- function(a){
  for(i in 1:100){
    if(a < i){
      return(i)
    }
  }
}

a <- 50
my.fun.return(a)


##Debugging
MyFunc_21 <- function(arg_01) MyFunc_22(arg_01)
MyFunc_22 <- function(arg_02) MyFunc_23(arg_02)
MyFunc_23 <- function(arg_03) MyFunc_24(arg_03)
MyFunc_24 <- function(arg_04) "MyString" + arg_04
MyFunc_21(99)

#Condition Handling
show_condition <- function(code){
  tryCatch(code,
           error = function(x) y <<- x)
}

show_condition(stop("!"))

