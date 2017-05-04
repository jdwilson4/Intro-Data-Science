#Rachel's path:
costOfLiving <- read.csv("https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/movehubcostofliving.csv", 
                         header = TRUE)

##Darianne's path
# costOfLiving <- read.csv("/Users/drl0110/Dropbox/Movehub GUI Final Project/movehubcostofliving.csv", header = TRUE)


#creating a function that takes a number in pounds returns the number in US dollars
poundsToDollars <- function(x) x * 1.25


# Rachel’s Work 04/18/2017 -----------------------------------------------------------
library(dplyr)
library(ggplot2)

coliv.adjusted <- as.data.frame(lapply(costOfLiving[,2:7], poundsToDollars))

#adjusted to the right US currency
final.costOfLiving <- cbind(City = costOfLiving$City, coliv.adjusted)
final.costOfLiving <- arrange(final.costOfLiving, City)
vec <- as.vector(final.costOfLiving$City)


#experimenting: Histogram and density of Cappuccino
#x <- final.costOfLiving$Cappuccino
#d1 <- density(x)

#hist(x, probability =  T)
#lines(d1)

#Histogram and density of Cinema
# hist(final.costOfLiving$Cinema, probability = T, n = 10)
# lines(density(final.costOfLiving$Cinema))
# 
# #histogram and density of Wine
# hist(final.costOfLiving$Wine, probability = T)
# lines(density(final.costOfLiving$Wine))
# 
# #Histogram and density of Gasoline
# hist(final.costOfLiving$Gasoline, probability = T)
# lines(density(final.costOfLiving$Gasoline))
# 
# #Histogram and density of Avg Rent
# hist(final.costOfLiving$Avg.Rent, probability = T)
# lines(density(final.costOfLiving$Avg.Rent))
# 
# #Histogram and density of Avg Disposable Income
# hist(final.costOfLiving$Avg.Disposable.Income, probability = T)
# lines(density(final.costOfLiving$Avg.Disposable.Income))



#---------------------------------------gglpot2 ----------------------------------------------------------

# item.prices <- function(Comparevar, colorz, x1, x2){
#   temp <- eval(call(paste("get.",Comparevar, sep = ""), x1)) #prepare function
#   temp2 <- eval(call(paste("get.", Comparevar, sep = ""), x2))
# 
#   ggplot(final.costOfLiving, aes(final.costOfLiving[Comparevar])) +
#     geom_density(color = colorz, fill = colorz) +
#     geom_vline(xintercept = temp, color = "red") +
#     geom_vline(xintercept = temp2, color = "yellow")
# 
# }
# item.prices("Wine", "pink", "Honolulu", "San Francisco")
#------------------------------------ANOTHER WAY ATTEMPT ----------------------------------------------------------
# WORKS! WORKS! WORKS! WORKS! WORKS!

graphDensity <- function(Comparevar, colorz, city1, city2){
  
  partitionData <- cbind(final.costOfLiving["City"], final.costOfLiving[Comparevar])
  head(partitionData)

  getValue1 <- function(city1) {
    cityInfo1 <- partitionData[which(partitionData[1] == city1), ]
    cityInfo1[[2]]
  }
  
  getValue2 <- function(city2){
    cityInfo2 <- partitionData[which(partitionData[1] == city2), ]
    cityInfo2[[2]]
  }
  
  cityA <- getValue1(city1)
  cityB <- getValue2(city2)

  ggplot(final.costOfLiving, aes(final.costOfLiving[Comparevar])) +
    geom_density(color = colorz, fill = colorz) +
    geom_vline(xintercept = cityA, color = "red") +
    geom_vline(xintercept = cityB, color = "yellow")

}

graphDensity("Avg.Disposable.Income", "green", "Geneva", "Honolulu")
#------------------------------------ANOTHER WAY ATTEMPT ----------------------------------------------------------

# Wine.ggplot2 <- function(x){
#   ggplot(final.costOfLiving, aes(final.costOfLiving$Wine)) + 
#     geom_density(color = "purple", fill = "purple") +
#     geom_vline(xintercept = get.Wine(x), aes(colour = "red"))
# }
# 
# Wine.ggplot2("San Diego")
# 
# Cinema.ggplot2 <- function(x){
#   ggplot(final.costOfLiving, aes(final.costOfLiving$Cinema)) + 
#     geom_density(color = "blue", fill = "blue") +
#     geom_vline(xintercept = get.Cinema(x), color = "red")
# }
# 
# Cinema.ggplot2("Honolulu")
# 
# 
# Capp.ggplot2 <- function(x){
#   ggplot(final.costOfLiving, aes(final.costOfLiving$Cappuccino)) + 
#     geom_density(color = "yellow", fill = "yellow") +
#     geom_vline(xintercept = get.Cappuccino(x), color = "red")
# }
# 
# 
# Gas.ggplot2 <- function(x){
#   ggplot(final.costOfLiving, aes(final.costOfLiving$Gasoline)) + 
#     geom_density(color = "lightblue", fill = "lightblue") +
#     geom_vline(xintercept = get.Gasoline(x), color = "red")
# }
# 
# 
# AvgRent.ggplot2 <- function(x){
#   ggplot(final.costOfLiving, aes(final.costOfLiving$Avg.Rent)) + 
#     geom_density(color = "lightgreen", fill = "lightgreen") +
#     geom_vline(xintercept = get.Avg.Rent(x), color = "red")
# }
# 
# DispIncome.ggplot2 <- function(x){
#   ggplot(final.costOfLiving, aes(final.costOfLiving$Avg.Disposable.Income)) + 
#     geom_density(color = "lightpink", fill = "lightpink") +
#     geom_vline(xintercept = get.DisposableIncome(x), color = "red")
# }
# 


#-------------------------------------------------------------------------------------------------------


#---------------------------------------------Functions-------------------------------------------------

#Function to get the price of Cappuccino given the city (which is x in this case)
# get.Cappuccino <- function(x) {
#   cityInfo <- final.costOfLiving[which(final.costOfLiving$City == x), ]
#   return(cityInfo[[2]])
# }
# #Works yay!
# get.Cappuccino("San Francisco")
# get.Cappuccino("Regina")
# 
# #Function to get the price of Cinema given the city
# get.Cinema <- function(x) {
#   cityInfo <- final.costOfLiving[which(final.costOfLiving$City == x), ]
#   return(cityInfo[[3]])
# }
# get.Cinema("San Francisco")
# 
# #Function to get the price of Wine given the city
# get.Wine <- function(x) {
#   cityInfo <- final.costOfLiving[which(final.costOfLiving$City == x), ]
#   return(cityInfo[[4]])
# }
# get.Wine("San Francisco")
# 
# #Function to get the price of Gasoline given the city
# get.Gasoline <- function(x) {
#   cityInfo <- final.costOfLiving[which(final.costOfLiving$City == x), ]
#   return(cityInfo[[5]])
# }
# get.Gasoline("San Francisco")
# 
# #Function to get the price of avg Rend given a city
# get.Avg.Rent <-function(x) {
#   cityInfo <- final.costOfLiving[which(final.costOfLiving$City == x), ]
#   return(cityInfo[[6]])
# }
# 
# get.DisposableIncome <- function(x) {
#   cityInfo <- final.costOfLiving$Avg.Disposable.Income[which(final.costOfLiving$City == x)]
#   return(cityInfo)
# }
# get.DisposableIncome("San Francisco")

#---------------------------------------------End of getFunctions-----------------------------------



#-------------------------------------------Point on Graph Function---------------------------------

# #function that graphs to show the city's wine price in comparison to whole data set
# graphWine <- function(x) {
#   yVal <- approxfun(density(final.costOfLiving$Wine))
#   plot(density(final.costOfLiving$Wine))
#   points(get.Wine(x), yVal(get.Wine(x)))
#   abline(v = get.Wine(x), col = "blue")
# }
# # 
# graphWine("Honolulu")
# graphWine("San Diego")
# 
# graphCinema <- function(x) {
#   yVal <- approxfun(density(final.costOfLiving$Cinema))
#   plot(density(final.costOfLiving$Cinema))
#   points(get.Cinema(x), yVal(get.Cinema(x)))
# }
# graphCinema("San Francisco")
# 
# graphCappuccino <- function(x) {
#   yVal <- approxfun(density(final.costOfLiving$Cappuccino))
#   plot(density(final.costOfLiving$Cappuccino))
#   points(get.Cappuccino(x), yVal(get.Cappuccino(x)))
# }
# graphCappuccino("San Diego")
# 
# graphGasoline <- function(x) {
#   yVal <- approxfun(density(final.costOfLiving$Gasoline))
#   plot(density(final.costOfLiving$Gasoline))
#   points(get.Gasoline(x), yVal(get.Gasoline(x)))
# }
# graphGasoline("San Francisco")
# 
# graphAvgRent <- function(x) {
#   yVal <- approxfun(density(final.costOfLiving$Avg.Rent))
#   plot(density(final.costOfLiving$Avg.Rent))
#   points(get.Rent(x), yVal(get.Rent(x)))
# }
# graphAvgRent("San Francisco")
# 
# graphDisposableIncome <- function(x) {
#   yVal <- approxfun(density(final.costOfLiving$Avg.Disposable.Income))
#   plot(density(final.costOfLiving$Avg.Disposable.Income))
#   points(get.DisposableIncome(x), yVal(get.DisposableIncome(x)))
# }
# graphDisposableIncome("San Francisco")
# 
# 
# 


