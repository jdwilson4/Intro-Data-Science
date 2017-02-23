x <- read.table(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/airports.csv",
           header = FALSE, sep = ",")


str(swiss)
plot(swiss)

#plot 2 scatter plots side by side
dev.new()
par(mfrow = c(1, 2))
#plot Agriculture against Examination and Education against Catholic
plot(swiss$Agriculture ~ swiss$Examination)
#plotting a scatterplot y against (~) x
#plot(x = swiss$Examination, y = swiss$Agriculture)
plot(swiss$Education ~ swiss$Catholic)

#A little more sophisticated
dev.new()
par(mfrow = c(2, 1))
#plot Agriculture against Examination and Education against Catholic
plot(swiss$Agriculture ~ swiss$Examination)
#plotting a scatterplot y against (~) x
#plot(x = swiss$Examination, y = swiss$Agriculture)
plot(swiss$Education ~ swiss$Catholic)

dev.new()
par(mfrow = c(1, 2))
#plot Agriculture against Examination and Education against Catholic
plot(swiss$Agriculture ~ swiss$Examination, col = "green", 
     xlab = "Examination", ylab = "Agriculture", 
     main = "Much Prettier 1", cex = 1.5, cex.main = 1.2,
     cex.lab = 1.2, cex.axis = 1.2)
#plotting a scatterplot y against (~) x
#plot(x = swiss$Examination, y = swiss$Agriculture)
plot(swiss$Education ~ swiss$Catholic, col = "blue",
     xlab = "Catholic", ylab = "Education", 
     main = "Much Prettier 2", cex = 1.1, cex.main = 1.1,
     cex.lab = 1.1, cex.axis = 1.1)


food <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/Food.csv", header = TRUE, sep = ",")
##Histograms
hist(food$energy_100g)

#save as a variable
x <- hist(food$energy_100g)

hist(food$energy_100g, n = 10000)
y <- hist(food$energy_100g, n = 10000)

dev.new()
par(mfrow = c(1,3))
hist(food$energy_100g, n = 10)
hist(food$energy_100g)
hist(food$energy_100g, n = 1000)


##ggplot2 code
diamonds <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science-2017/master/Data/diamonds.csv", 
                     header = TRUE, sep = ",")

str(diamonds)


#install ggplot2
install.packages("ggplot2")

#call it for this work session
library(ggplot2)

#set a random number generator for the sample
set.seed(1410)
#head(sample(nrow(diamonds), 100))

diamonds_subset_01 <- diamonds[sample(nrow(diamonds), 100), ]
# color of points will be the color of the diamond
qplot(carat, price, data = diamonds_subset_01, colour = color)

# shape of the points will correspond to the shape of the diamond
qplot(carat, price, data = diamonds_subset_01, shape = cut)

# plot of price against carat with a line representing each color
dev.new()
qplot(carat, price, data = diamonds_subset_01, colour = color, 
      geom = "line")

# plot with smooth lines representing each color
dev.new()
qplot(carat, price, data = diamonds_subset_01, colour = color, 
      geom = "smooth")

#Histograms
dev.new()
qplot(carat, data = diamonds, geom = "histogram", colour = color,
      binwidth = 0.025, fill = color)
dev.new()
qplot(carat, data = diamonds, geom = "density", colour = color)


##Faceting
dev.new()
#plot a histogram of carat (a continuous variable) against types of color
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.025, facets = . ~ color)

#plot a histogram of price (an integer variable) against types of color
dev.new()
qplot(price, data = diamonds, geom = "histogram", facets = . ~ color)

avgs <- aggregate(diamonds$price, by = list(Color = diamonds$color), FUN = "mean")
meds <- aggregate(diamonds$price, by = list(Color = diamonds$color), FUN = "median")


#First work with ggplot()

ggplot(diamonds, aes(carat, price, colour = cut)) + geom_point()

# note that a ggplot plot object can be stored in a variable
# the following code generate identical results 

myPlot <- ggplot(diamonds, aes(carat, price, colour = cut))

myPlot + geom_point()

myPlot + geom_line()

myPlot + geom_point() + geom_line()

myPlot + geom_point() + geom_smooth()
(myPlot <- myPlot + geom_point())


#Adding a regression curve
myBestFitLine <- geom_smooth(method = "lm", se = F, 
                             colour = alpha("steelblue", 0.75), size = 5)

qplot(sleep_rem, sleep_total, data = msleep) + myBestFitLine

qplot(awake, brainwt, data = msleep) + myBestFitLine

qplot(bodywt, brainwt, data = msleep, log= "xy") + myBestFitLine