#Loops and Functional Programming

#for loops

for(i in 1:5) print("BSDS 100")

#for the safe side, let's use brackets. This is equivalent to the above
for(i in 1:5){
  print("BSDS 100")
}

#what's happening with i?

for(i in 1:5){
  print(i)
  print("BSDS 100")
}

#we don't have to iterate numerically, instead e.g., we can go through all 
#levels in a factor

values <- factor(c("A", "A", "B", "C", "C", "C", "ZzZ"))
levels(values)
for(k in levels(values)){
  print(k)
}

#we can update the seq for the looping variable and it won't change the originally
#specified seq.

for(i in 1:10){
  i = i + 10
  print(i)
}

##while loops
#printing "MSAN 3 times"
n <- 3
while(n > 0){
  print("MSAN")
  n <- n - 1
}

#contrast this with the following

n <- 3
while(n > 0){
  n <- n - 1
  print("MSAN")
}

#what happens in the following?
n <- 3
while(n > 0){
  n <- n + 1
  print("MSAN")
}


#repeat loops
# will keep executing what is inside the loop until a "break" condition is met

x <- 7
repeat{
  print(x)
  x <- x + 2
  if(x > 10) break
}

#the above is equivalent to the following while() loop
x <- 7
while(x <= 10){
  print(x)
  x <- x + 2
}


x <- -3
#if else statement
if (x > 0){
  print("x is positive")
} else{ #else must begin on the same line for which the if{} statement ends
  print("x is negative")
}


#if else if statements

x <- 0
x <- -2
x <- 2
x <- "a"

if(x > 0){
  print("x is positive")
}else if(x < 0){
  print("x is negative")
}else{
  print("x is zero")
}

#trying the above on a vector will toss a warning
x <- c(-1, 1)

if(x > 0){
  print("x is positive")
}else if(x < 0){
  print("x is negative")
}else{
  print("x is zero")
}

#vectorized if() else with ifelse()
x <- c(-1, 1)
ifelse(x > 0, "x is positive", "x is negative")
#first argument is the condition, the second is the expression if condition is TRUE
#third argument is the expression if condition is FALSE
x <- c(-1, 1, 0)
ifelse(x > 0, "x is positive", "x is negative")

#note the above calls 0 "negative" which is not cool.
#to call it "x is zero" we can combine another ifelse() statement
#inside of this original one
x <- c(-1, 1, 0)
ifelse(x > 0, "x is positive", 
       ifelse(x < 0, "x is negative", "x is zero"))


#the switch statement
grades <- c("A", "D", "F")
for(i in grades){
  print(switch(i,
          A = "Well Done!",
          B = "Alright",
          C = "C's get degrees",
          D = "Meh",
          F = "Uh-oh")
  )
}

#update grades according to the above switch
grades2 <- rep(0, length(grades))
for(i in 1:length(grades)){
  grades2[i] <- switch(grades[i],
                    A = "Well Done!",
                    B = "Alright",
                    C = "C's get degrees",
                    D = "Meh",
                    F = "Uh-oh")
}
