###Using paste to label plots###

#plot the histogram where I change the mean for each plot
dev.new()
mu <- seq(0, 5, by = 1)
par(mfrow = c(3, 2))
for(i in 1:length(mu)){
  #generating 1000 random samples from a 
  #N(mu, 1) distribution
  data <- rnorm(10000, mean = mu[i], sd = 1) 
  hist(data, n = 100, 
       main = paste("Mean =", mu[i], sep =" "))
}

#collapse can be used to make a vector of 
#strings into a single string

trial1 <- paste(c("abc", "def", "ghi"), collapse = " ")
#trial1 has length 1 and nchar = 11
trial2 <- paste(c("abc", "def", "ghi"), sep = " ")
#trial2 has length 3 and nchar = c(3,3,3)
trial3 <- paste(c("abc", "def", "ghi"), sep = ",", collapse = " ")
#collapse argument overrides sep argument

trial4 <- paste(c("abc", "def", "ghi"), collapse = ",")

##How to get x_12345 with paste and vector operations
paste("x", paste(1:5, collapse = ""), sep = "_")

#key point: collapse must be used to make a vector into a single string!
LETTERS[1:8]

#substrings
mystring5 <- "my tiny bed"
trial <- substring(mystring5, first = c(1, 4, 9), last = c(2, 7, 11))
