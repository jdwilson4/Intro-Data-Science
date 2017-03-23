#print all numbers from 1 to 10

for(i in 1:10){
  print(i)
}

#print all numbers from 5 to 15 in multiples of 5

for(i in seq(from = 5, to = 15, by = 5)){
  print(i)
}

#Print assignment scores
scores <- c(95, 80, 100, 93, 72)
for(i in 1:5){
  cat("Assignment", i, scores[i], "\n", sep = " ")
  #print(i)
}


##Print the unique numbers in a numeric vector
x <- c(rep(10, 5), rep(3, 2), 1, 5)

for(k in unique(x)) print(k)

y <- factor(x)

for(k in unique(y)) print(k) #prints values when they are observed

for(k in levels(y)) print(k) #prints ordered levels


#Showing that the loop will not change 
#when looping variable is changed in the loop

for(i in 1:5){
  i <- i + 2
  print(i)
}

###An infinite while loop

x <- 1
while(x < 2){
  print(x)
}


#Print MSAN 3 times
n <- 3

#while loop
while(n > 0){
  print("MSAN")
  n <- n - 1
  print(n)
}

#for loop
for(i in 1:3){
  print("MSAN")
}

##A repeat loop with break command
x <- 7
repeat{
  print(x)
  x <- x + 2
  if(x > 11){
    break
  }
}

#A few examples of the if() statement

#1: checking the type of data 

#run these data assignments one at a time
data <- c(TRUE, FALSE)
data <- c("Hello World")
data <- c(2, 3)

if(class(data) == "numeric"){
  print("my data is numeric!")
}
if(class(data) == "logical"){
  print("I am more logical than you")
}
if(class(data) == "character"){
  print("I'm a string!")
}

#2: if() else() statement
if(class(data) == "numeric"){
  print("my data is numeric")
}else{print("I'm not numeric!")}

#3: An error if else() does not immediately follow the end } of if()
if(class(data) == "numeric"){
  print("my data is numeric")
}
else{print("I'm not numeric!")}

#4: if() elseif() else()
data <- c("BSDS 100")
if(class(data) == "numeric"){
  print("my data is numeric!")
}else if(class(data) == "logical"){
  print("I am more logical than you")
}else if(class(data) == "character"){
  print("I'm a string!")
}else{
  print("I have no idea what this data is")
}

#5: I want "I have no idea what this data is" to print
#4: if() elseif() else()
data <- NULL
if(class(data) == "numeric"){
  print("my data is numeric!")
}else if(class(data) == "logical"){
  print("I am more logical than you")
}else if(class(data) == "character"){
  print("I'm a string!")
}else{
  print("I have no idea what this data is")
}
data <- factor(c("A", "B"))

##ifelse() statements are for vectors!
x <- c(-1, 2, -2, 0)

#print whether or not each entry is negative or positive
ifelse(x > 0, "entry is positive", "entry is negative")

###To think about: you could also do this with a for() loop
# where if() statements are embedded.

