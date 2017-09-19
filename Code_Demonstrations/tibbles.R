#Code for Tibbles in R for Data Science book

install.packages("tidyverse") #contains many contemporary
#packages created by Hadley Wickham and colleagues

library(tidyverse)

#datasets stored in R are naturally stored as
#data frames. Let's look at the iris data set as an example

data1 <- iris
str(data1)

#coerce a data frame to be a tibble:
data2 <- as.tibble(data1)

#note - the tibble version of a data frame will look
#very similar to the original data frame. 

str(data2) #we see that it is stored as a 'tbl_df', 'tbl',
#and 'data.frame' object

#creating a tibble object
data3 <- tibble(x = 1:5, y = 1,
                z = x^2 + y
)

data3

##tibbles are more flexible than data frames especially
#with naming of variables (columns). In fact, you can
#use any type of emoji or spaces in a name as long as 
#you refer to them with back ticks ` `
tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)

#also - tibbles do not automatically convert strings
#to factors! (no need to use the stringsAsFactors argument!)

#example - calling the :) variable
tb$`:)`
#you could not do this with a data frame!

##you can now also directly input rows without
#worrying about coercion using the tribble() function

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)

##printing all columns and a selected number of rows of
# a tibble

install.packages("nycflights13")
nycflights13::flights #by default, this will print
#10 rows and as many columns as available on your current
#screen. But, we can modify what we print to the screen
#using the print() function. the argument n = will allow us to 
#print the number of rows that we'd like and width = will provide the 
#number of columns printed to screen

#print 5 rows and show all columns
print(nycflights13::flights, n = 5, width = Inf)
#not very pretty but allows us to look at all the columns at once


#setting the following options will always print every column
options(tibble.width = Inf)
nycflights13::flights


###subsetting a tibble
df <- tibble(
  x = runif(5),
  y = rnorm(5),
  z = c("a", "b", "c", "d", "e")
)

#make sure that we all have the same tibble by setting a seed
set.seed(123)
df <- tibble(
  x = runif(5),
  y = rnorm(5),
  z = c("a", "b", "c", "d", "e")
)

#subsetting columns using the same method as data frames ($)
df$y

#flexible way using [[""]]
df[["x"]]

df[["z"]]

##calling columns by position
df[[1]] #give the first column of df

#can also use "old" way of calling columns as in data frame calls
df[, 1]
df[, c(1,3)]

##partial matching from a data frame
df.dataframe <- data.frame(
  dog = runif(5),
  y = rnorm(5),
  z = c("a", "b", "c", "d", "e")
)

df.dataframe$do
df.dataframe$d


##plotting 2 variables using a scatter plot

head(data1)
dev.new()
plot(x = data1$Sepal.Length, y = data1$Sepal.Width)
