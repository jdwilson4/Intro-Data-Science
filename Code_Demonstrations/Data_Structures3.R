#Lists are useful because we can store heterogeneous data:
# i.e., data of different types, and of different lengths

myList <- list(c(1, 2, 3), c(T, F), c(3.1415, 9), "abc")
myList

#note that entries in a list are indexed with double brackets [[ ]]

##calling the first entry (which is a vector c(1, 2, 3))
myList[[1]]


#what happens if we use a single bracket?
myList[1]

str(myList[[1]]) #numeric
str(myList[1])

##try calling matrix rows in a list. Example of recursive
## calling

myList2 <- list(matrix(1:9, nrow = 3), c(T, F, T), "ade")
#let's get the second row of the matrix in the first entry
myList2[[1]][2,]


#getting the first two entries in the list
myList2[1:2] #this will be returned as a list

##naming and calling entries of a list using its name

myList3 <- list(Matrix = matrix(1:9, nrow = 3), 
                Logicals = c(T, T, F),
                Numeric = c(3.145, 3/4))

#calling the Logicals vector
myList3[[2]]
#this is equivalent to...
myList3$Logicals


##The unlist() function - this function will "unpack" a list by its
# components one at a time and concatenate them all to be a single vector.
# Note - this will cause coercion. Also, unlisting matrices takes entries
# according to columns
unlist(myList3)

#as an example of unlisting a matrix
unlist(matrix(1:9, ncol = 3)) #this didn't work! so, the input object must 
# be a list!

##########
#Playing around with Data Frames in R
?ToothGrowth
ToothGrowth

#Information - data frames are stored in the following way:
# rows = observations or samples
# columns = measurements / features / variables 
# this is the standard way of storing data for the use of Machine Learning and
# regression modeling


#In general, we name the variables (i.e. the columns) and can easily call them 
# using the $ argument. This is the same as in lists
ToothGrowth$dose

#We can also subset in the same way that we subset matrices

#get the second row
ToothGrowth[2, ] #this is still stored as a data frame since each column may have
# different data types

ToothGrowth[2, 2]


##Creating our own data frame
df.1 <- data.frame(Logicals = c(T, F, T, F), Age = c(21, 17, 32, 81))
str(df.1)


#Caution about data frames:
# - whenever strings are input as a variable, data frames will automatically
# store them as factors (categorical data with a certain number of levels).
# to avoid this, use the argument stringsAsFactors = FALSE.

#Example - 
df.factors <- data.frame(Logicals = c(T, F, T, F), Age = c(21, 17, 32, 81), 
                         Strings = c("my", "name", "is", "bob"))
str(df.factors) #key point - this treats the Strings variable as a factor

df.strings <- data.frame(Logicals = c(T, F, T, F), Age = c(21, 17, 32, 81), 
                         Strings = c("my", "name", "is", "bob"),
                         stringsAsFactors = FALSE)
str(df.strings) #yay!

#Appending two data frames
#rough example - appending Strings as a new variable for df.1
Strings <- c("my", "name", "is", "bob")

df.2.trial <- cbind(df.1, Strings)
str(df.2.trial)
#note - the strings were treated again as factors
#trial to see if we can avoid that
df.2.trial2 <- cbind(df.1, Strings, stringsAsFactors = FALSE)
#success!!

##Adding a new observation to the data frame df.strings
# the new observation is FALSE, 19, and "lucy"

##First, the wrong way of doing this
new.df.wrong <- rbind(df.strings, c(FALSE, 19, "lucy"))
str(new.df.wrong)
#the issue is that the first vector all got coerced to be a character,
# and then each column of the data frame subsequently got coerced to characters!


#To avoid coercion, rbind data frames instead
new.df.right <- rbind(df.strings, 
                      data.frame(Logicals = FALSE, Age = 19, 
                                 Strings = "lucy"))

str(new.df.right)


#one more note, data frames that are rbinded together must have the same 
#variable names
wont.work <- rbind(df.strings, 
                   data.frame(Truth = FALSE, Age = 19, 
                   Strings = "lucy"))

maybe.work <- rbind(df.strings, 
                    data.frame(FALSE, 19, 
                               "lucy"))
#also does not work - we must name each new variable to be the same as the 
# original data frame

######################
#What can happen when adding a new column of the wrong length to df.strings
vec.1 <- -1
vec.2 <- -1:-2
vec.3 <- -1:-99
vec.4 <- c("-1", -2)
vec.5 <- c("a", -1, -2)

cbind(df.strings, vec.1) #repeats -1 to fill in missing entries
cbind(df.strings, vec.2) #repeats the vector to fill in missing entries
cbind(df.strings, vec.3) #throws an error as it doesn't automatically repeat the
                         #original data frame
cbind(df.strings, vec.4) #repeats the last values, and coerces to be factors
                         #since we did not specify stringsAsFactors = FALSE

cbind(df.strings, vec.5) #throws an error - did not repeat character values

#swapping the columns of a data frame
df.strings
df.strings[, c(1, 3, 2)]
