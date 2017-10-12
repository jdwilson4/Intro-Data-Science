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
diamonds_subset_01 <- diamonds[]