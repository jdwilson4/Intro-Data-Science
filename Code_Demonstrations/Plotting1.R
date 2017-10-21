##Plotting in R

#Load the Food data from Github

food <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/Food.csv",
                header = TRUE, sep = ",")
header(food)

#plot a bar chart of pnns_groups_1
plot(food$pnns_groups_1) #this will print in the plots section to the bottom right

#plot in a new window
dev.new()
plot(food$pnns_groups_1)

#adding a few arguments for labels
plot(food$pnns_groups_1, main = "Food Groups",
     ylab = "Number", xlab = "Food Type")

#making the x axis labels smaller
plot(food$pnns_groups_1, las = 2, xlab = "Food Type")

#------------------------
#Pairwise scatter plots
data <- swiss

#scatter plot of every variable against one another in a grid
plot(data)

#scatter plot of say the first 3 variables
plot(data[, 1:3])

#equivalent way of doing this with the pairs() function
pairs(data)

#--------------------

##Histograms
dev.new()
hist(food$energy_100g)

#same histogram but with more bars (100 of them)
dev.new()
hist(food$energy_100g, n = 100)

#side-by-side plotting
par(mfrow = c(1, 2)) #will split the image space into 1 row and 2 columns
hist(food$energy_100g)
hist(food$energy_100g, n = 100)

#more plots
dev.new()
par(mfrow = c(2, 2)) #2 rows and 2 columns
hist(food$energy_100g)
hist(food$energy_100g, n = 100)
plot(food$pnns_groups_2)
plot(food$pnns_groups_1)

#adding a density curve on top of a histogram
#step 1 - show proportions rather than counts
hist(food$energy_100g, n = 100, probability = TRUE)
#step 2 - add a density curve using lines() function
lines(density(food$energy_100g, na.rm = TRUE), col = "pink",
      lwd = 3)
#lwd = line width
lines(density(food$energy_100g, na.rm = TRUE), col = "pink",
      lwd = 7)

#getting a dotted pink line instead
hist(food$energy_100g, n = 100, probability = TRUE)
#step 2 - add a density curve using lines() function
lines(density(food$energy_100g, na.rm = TRUE), col = "pink",
      lwd = 5, lty = 2)


#-------------------------------
#box plots
par(mfrow = c(1,1))
boxplot(food$energy_100g) #a single boxplot of energy_100g

#show boxplot of this variable across food groups in
#pnns_groups_1
boxplot(food$energy_100g ~ food$pnns_groups_1, las = 2)


#-------------------------------
#working with qplot and ggplot2 on the diamonds dataset

#first, read in the diamonds data set
diamonds <- read.csv(file = "https://raw.githubusercontent.com/jdwilson4/Intro-Data-Science/master/Data/diamonds.csv",
                     header = TRUE)

#get a subset to make it easier to manage
set.seed(123)
diamonds_subset_01 <- diamonds[sample(nrow(diamonds), 100), ]

#create a scatterplot of carat against price where points are colored 
#according to diamond color
install.packages("ggplot2")
library(ggplot2)
dev.new()
qplot(carat, price, data = diamonds_subset_01, colour = color)

#repeat the above, but set shape to be color
dev.new()
qplot(carat, price, data = diamonds_subset_01, shape = color)

#let shapes represent cut and color of points represent color
dev.new()
qplot(carat, price, data = diamonds_subset_01, colour = color, shape = cut)


#Plotting histograms and density plots
#histogram of carat size with frequencies for each color of diamond
dev.new()
qplot(carat, data = diamonds, geom = "histogram", fill = color)

dev.new()
qplot(carat, data = diamonds, geom = "density", fill = color)

#note using "colour" instead of "fill" will just give lines of the
#specified colors
dev.new()
qplot(carat, data = diamonds, geom = "density", colour = color)

##using two different geoms at once. price against carat with
# a smooth curve "of best fit"
dev.new()
qplot(carat, price, data = diamonds_subset_01, shape = color,
      geom = c("point", "smooth"))
#the above gives a line for each color of diamond

dev.new()
qplot(carat, price, data = diamonds_subset_01, 
      geom = c("smooth", "point"))

#using the facets option for scatter plots of price against carat
dev.new()
qplot(carat, price, data = diamonds, facets = . ~ color, geom = "point")
#observation - seems that price gets lower for higher carat diamonds as color goes from D to J


#---------------------------
#Using ggplot
#Important point - these functions now work in layers. So, you have 
#to first specify a ggplot() object with aesthetics (i.e., aes()), and
#then add geometric objects, or other objects to the original plot

#Interesting (and useful) - ggplot's are objects, so they can be saved and loaded
#easily

plot1 <- ggplot(diamonds, aes(x = carat, y = price, colour = color))
dev.new()
plot(plot1) #note this is blank because we haven't told it what to provide

plot2 <- plot1 + geom_point()
plot(plot2)

#say now we want to add shapes for the cut of the diamond
plot3 <- plot2 + geom_point(aes(shape = cut))

#adding a smooth line to the original plot
plot3 <- plot3 + geom_smooth()
plot(plot3)

#the above gives a different smooth line to every color
# which is cool, but what if we just want a single line
# for all data?

# to do this, we need to re-order our specifications.
plot1b <- ggplot(diamonds, aes(x = carat, y = price))
plot2b <- plot1b + geom_smooth() #line first
plot3b <- plot2b + geom_point(aes(colour = color, shape = cut)) #then add colors and shapes
dev.new()
plot(plot3b)


#use inherit.aes = FALSE to ignore previously defined aesthetics
plot4 <- plot2 + geom_point(aes(shape = cut)) +
  geom_smooth(inherit.aes = FALSE, aes(x = carat, y = price))


#you can also store geometric objects and apply them to any plot! (super useful!!)
myBestFittedLine <- geom_smooth(method = "lm", se = T, 
                                colour = alpha("steelblue", 0.5), size = 2)

plot4 + myBestFittedLine

#changing axis and legend titles
plot4 + xlab("Carat") + ylab("Price") + 
  guides(fill=guide_legend(title="Color"))