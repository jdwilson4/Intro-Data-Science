#String Analysis Part 1
library(stringr)

string <- "this is a string"

#note - if you forget a quotation mark, then the string will
# contain \n which represents a new line.

#creating strings with quotations inside
string.w.quotations <- "Bob said \"Hello, my name is Bob\" "


double_quote <- "\"" #includes slash, but this is not the string itself
#to view the string, use the function writeLines

writeLines(double_quote)

double_quote2 <- '""'

single_quote <- "\'"

#look up a list of special characters in R
?"'"

#printing a mu to the screen
x <- "\u00b5"
x

#counting the number of characters in each string of a 
#vector

str_length(c("a", "R for data science", NA))
#Note - this does count white space

#compare the above with getting the length of a vector
length(c("a", "R for data science", NA))

##Combining strings

str_c("x", "y")
#returns "xy"

str_c("x", "y", "z")
# returns "xyz"

#separating the concatenated strings using the sep argument

#a comma and then a space
str_c("x", "y", sep = ", ")

#a colon
str_c("x", "y", sep = ":")

#a tilde
str_c("x", "y", sep = "~")

#a space
str_c("x", "y", sep = " ")

#a tab
str_c("x", "y", sep = "\t") #note here the \t is included. To
#see what the string actually looks like, use writeLines()

writeLines(str_c("x", "y", sep = "\t"))

#writing out NA in the text object
x <- c("abc", NA)
str_c("|-", x, "-|")
#> [1] "|-abc-|" NA
str_c("|-", str_replace_na(x), "-|")
#> [1] "|-abc-|" "|-NA-|"

x <- c("abc", "de")
#what if our aim is to print "|-abc, de-|" ?
trial1 <- str_c("|-", x[1], x[2], "-|") #close but no commas
trial2 <- str_c("|-", str_c(x[1], x[2], sep = ", "), "-|")

#so trial2 works here. Note - str_c() expects individual entries not vectors

##a quick trial with an if() statement

name <- "Hadley"
time_of_day <- "morning"
birthday <- FALSE

str_c(
  "Good ", time_of_day, " ", name,     #prints Good morning Hadley
  if (birthday) " and HAPPY BIRTHDAY", #if birthday == TRUE, then this prints
  "."                                  #and HAPPY BIRTHDAY
)

birthday = TRUE
str_c(
  "Good ", time_of_day, " ", name,     #prints Good morning Hadley
  if (birthday) " and HAPPY BIRTHDAY", #if birthday == TRUE, then this prints
  "."                                  #and HAPPY BIRTHDAY
)


##collapsing an entire vector of strings into a single string
str_c(c("x", "y", "z"), collapse = ", ")
#> [1] "x, y, z"

##Revisiting the previous example
x <- c("abc", NA)

#aim: typing "|-abc, NA-|"
trial2 <- str_c("|-", str_c(str_replace_na(x), collapse = ", "), "-|")

#comment - go through the above function from the "inside" "out" to
#make sure you understand what is happening with each functional call

##------ Subsetting strings-------- ##
x <- c("Apple", "Banana", "Pear")

#will give us the 1st through 3rd entry of each string in the vector x
str_sub(x, 1, 3)

#> [1] "App" "Ban" "Pea"

#can use str_sub as an assignment
#example - replacing capital letters with lower case letters

str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1, 1))

#going back and capitalizing the first entries
str_sub(x, 1, 1) <- str_to_upper(str_sub(x, 1, 1))


#----- Pattern matching ------#

#Case 1 - Exact matching
x <- c("apple", "banana", "pear")
str_view(x, "an") #note - will give the first instance of a match!
str_view(x, "ea")

#something not in the vector
str_view(x, "re")

#exact matching is case-sensitive
str_view(x, "Ap")

#Important note - it is difficult to catch all
#grammatical errors, misspellings, and mis-capitalizations
#with exact match.

#matching "any" character using .
str_view(x, ".a.") 
#identifies any sequence of 3 characters _a_


#to match the special character ".", we need to use
#a double escape or "\\."


# And this tells R to look for an explicit .
str_view(c("abc", "a.c", "bef"), "a\\.c")

#does a single escape work?
str_view(c("abc", "a.c", "bef"), "a\.c")
#throws an error because it escapes from the text

# searching for \ in text requires searching with
# four backslashes! i.e., we search with "\\\\"

x <- "a\\b"
writeLines(x)
#> a\b

str_view(x, "\\\\")


#Searching for characters that start a string
#use the special character ^ which is the anchor
#to the beginning of a string

x <- c("apple", "banana", "pear")
#give all matches where "a" starts the string
str_view(x, "^a")

#use the special character $ to anchor the end of 
# a string. 

#give all matches where "a" ends the string
str_view(x, "a$")

#identifying instances that are exactly a word.

x <- c("apple pie", "apple", "apple cake")

#first, give all matches of "apple"
str_view(x, "apple")

#give exact matches of "apple" where that is the only
#sequence in the string

str_view(x, "^apple$")
