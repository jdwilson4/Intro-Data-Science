#This is based on the first lecture on data structures in class 

#double vector
double.vector <- c(1, 3.14, 99.999)

#integer vector -- L is used to indicate that the preceding number
#should be stored as an integer
integer.vector <- c(1L, 14L, 23L)

#logical vector -- must be written in caps (TRUE/FALSE) or 
#shorthand (T/F)
logical.vector <- c(TRUE, FALSE, T, F)

#character vector -- entries must be surrounded by quotations ""
char.vector <- c("this", "is a", "string")

#checking the types of each of these vectors
typeof(integer.vector)
typeof(logical.vector)
typeof(char.vector)

#viewing the vectors
char.vector #output is shown with spaces

#length of the vector
length(char.vector)

myFavNum <- 3/4
#note the above does the division, but if you want to keep 
#its fractional form, store as a string
myFavNum <- "3/4" 
#or
myFavNum <- c("3/4")

FavNums <- c(3.14, 4, 15, 23, 1.49, 17.5, 13)

firstNames <- c("Austria", "Vi")

#first attempt is to input text and then a number
myVec <- c("Wilson", 30)

myVec #this automatically coerces 30 to be a string
#we need to be careful about coercion in R! (there were no
# errors thrown.)


##Vector subsetting
myAtomicVector <- c(1, 2, 3, 4, -99, 5, NA, 4, 22.233)

typeof(myAtomicVector)

#calling the 3rd entry. use brackets []. 
#Note to Python/C/C++/... users -- counting starts with 1 not 0!
myAtomicVector[3]

#in general, we can put any length of an index inside brackets
#for subsetting
indx <- c(1, 3, 7)
myAtomicVector[indx]

#calling an index that doesn't exist. In our example the 10th entry
myAtomicVector[10]

#calling all values except for the 7th term (which is NA)
myAtomicVector[-7]

#calling all non-NA values
#1 - which values are NA?
logical.of.nas <- is.na(myAtomicVector) #logical vector TRUE if NA

#2 - create index of which values above are TRUE
indx.of.nas <- which(logical.of.nas)

#3 - keep everything that is not NA
myAtomicVector[-indx.of.nas]

#------------------------------
##Operations on vectors
vec.1 <- c(1, 3, 5)
vec.2 <- c(3.14, 1.49, 23)

#1 adding two vectors of the same length - entry-wise addition
vec.sum <- vec.1 + vec.2

#2 subtraction of two vectors
vec.diff <- vec.1 - vec.2

#3 entry-wise multiplication of two vectors
vec.mult <- vec.1 * vec.2

#4 entry-wise quotients of two vectors
vec.quotient <- vec.1 / vec.2

#5 exponentiation
vec.exp <- vec.1 ^ vec.2

###each of these can also be done for scalar operations
#example
vec.scalar <- vec.1 * 3

##dot products (x^T x)
vec.dot <- vec.1 %*% vec.2

##using standard functions on a vector
#squareroot of each value
vec.sqrt <- sqrt(vec.1)
vec.sqrt

#exponentiation
vec.exp2 <- exp(vec.1)

#-----------------------------
#summing every value in a single vector
vec1.sum <- sum(vec.1)

#average every value in a single vector
vec1.mean <- mean(vec.1)

#extremes of vector
vec1.min <- min(vec.1) #the minimum value
vec1.min.indx <- which.min(vec.1) #the index of the minimum value

vec1.max <- max(vec.1) #the maximum value
vec1.max.indx <- which.max(vec.1)


#---------------
#getting rid of NA's when doing operations
vec.3 <- c(99.7, 99.2, 91, NA, 92, NA)
#sum the vector ignoring NA's 
sum(vec.3, na.rm = TRUE)

#note if we don't use na.rm = TRUE, then we will get NA 
sum(vec.3)

#mean of vector ignoring NA's
mean(vec.3, na.rm = TRUE) #note - this will completely ignore
#NA from any calculation
