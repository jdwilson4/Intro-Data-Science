##Playing around with coercion of R

trial.1 <- c(TRUE, 3.14, 2L)
class(trial.1) #check the type

typeof(trial.1) #double as it is more flexible than logical and integers

trial.1 * TRUE #multiplies each entry by 1
trial.1 * FALSE #multiplies each entry by 0


#user coercion
trial.2 <- c(0, 1, -14, 3.14)
#create a logical out of this
as.logical(trial.2) #any number aside from 0 will be treated as TRUE

#give a summary of the data types in any data structure
str(trial.2)

##conditional subsetting
trial.2
#return the values that are non-negative
trial.2[trial.2 >= 0]
#return the values that are positive
trial.2[trial.2 > 0]
#return the values that are negative
trial.2[trial.2 < 0]
#return the values that are non-positive
trial.2[trial.2 <= 0]

#under the hood, what is happening?
trial.2 >= 0 
#the above is a logical vector. So, calling this on the inside
# of a subset will return vector values that are TRUE

#return values that are exactly equal to 0
trial.2[trial.2 == 0]

#return a value that is not in the vector
trial.2[trial.2 == 3] #returns "numeric(0)"
#the equivalent of "nothing" in R is "numeric(0)"

#trying the rep() and seq() functions

#example - grid of numbers between 0 and 1
grid <- seq(from = 0, to = 1, by = 0.1)

#equivalent to the following:
grid <- seq(0, 1, 0.1)

#we can go more granular here
grid.small <- seq(0, 1, 0.001)

#repeating values with rep()
rep(0.1, 10)

#repeating the above sequence "grid" 10 times
rep(grid, 10)

#a few errors 
# setting "to" to be smaller than "from"
seq(0, -3, .5)

seq(0, -3, -.5)

#integers between 1 and 10
1:10

#integers between 0 and -10
0:-10

#integers between 5 and -5
5:-5
-5:5


#the names attribute
named.vec1 <- c("James" = 3.14, "Vi" = 2, "Jeremiah" = 7)

named.vec1 + 3

#with names, we can call a specific entry using its name:
named.vec1[names(named.vec1) == "James"]
named.vec1[names(named.vec1) == "Jeremiah"]

#creating matrices out of vectors
mat.1 <- matrix(1:10, nrow = 2, ncol = 5)
#importantly, this by Default will stack by columns

#stack by rows instead, use byrow = TRUE
mat.2 <- matrix(1:10, nrow = 2, ncol = 5, byrow = TRUE)

#creating a matrix using rbind() and cbind()
vec.1 <- seq(1, 3, 1)
vec.2 <- rep(2, 3)

#stack vectors side by side in columns
mat.3 <- cbind(vec.1, vec.2)

#stack vectors on top of one another in rows
mat.4 <- rbind(vec.1, vec.2)

#can also rbind or cbind matrices (as long as the dimensions match)

#an example that will fail
rbind(mat.3, mat.4)
cbind(mat.3, mat.4)

#but, we can take a transpose of one of the matrices to get this to work
#transpose mat.3
t(mat.3)

rbind(t(mat.3), mat.4)

#create a simple array with 2 rows, 3 columns, and 2 layers
array.1 <- array(1:12, c(2, 3, 2))


##Subsetting matrices and arrays
#now we need to specify indices for the rows, columns, and layers when in an array

#calling the 1st row, 2nd column, 2nd layer
array.1[1, 2, 2]

#calling the entire 2nd column of the 2nd layer
array.1[, 2, 2]

#calling the entire 2nd row of the 2nd layer
array.1[2, , 2]

#call the entire 2nd layer
array.1[, , 2]

#first row of mat.1
mat.1[1, ]

#fancier footwork
#1st row, 1st three entries
mat.1[1, 1:3]




#extraneous stuff
as.logical(1e-34) #even with numbers that are reaaaally close to
# 0, R will automatically treat it as a TRUE

as.logical(1e-350) #treated as 0 because R cannot store beyond a certain number of decimal points

as.logical(1e-64)
as.logical(1e-65)
as.logical(1e-324) #the number of decimal places that R can 
# hold seems to depend on the user's RAM

1e-324 #rounds to 0

##Quick digression - multiplication of really small numbers

##note: x * y = 10^(log10(x) + log10(y))

-324 + log10(1e-50)
10^(-374)
