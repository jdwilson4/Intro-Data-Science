#Making my first plot

# store x as 1 through 10
x <- 1:10

# store y as x squared
y <- x^2

# very simple plot of y against x (y on y axis)
plot(y ~ x)

# more sophisticated plot with blue line and points
plot(y ~ x, type = "b", col = "blue", cex = 1.5, main = "My first Plot")


#Seeing a warning pop up
z <- -3
sqrt(z)

?plot

#example of looking for a function that is not 
# in any package currently downloaded in your R session

#First, let's install the package ergm
install.packages("ergm")
?ergm

#note - the above could not find the function ergm

??ergm

#the above shows that the ergm function is available in the
# ergm package (which means that I've installed it before)

#so, I just need to load that package to my current R session
# for this, I can use library() or require()
library(ergm)

?ergm


#Examples of clearing environment

#clear x
rm(x)

#clear everything
rm(list = ls())

#clear the console
cat("\014")
