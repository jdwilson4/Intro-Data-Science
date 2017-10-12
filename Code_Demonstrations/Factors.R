##Factors
library(tidyverse)
install.packages("forcats")
library(forcats)

##Creating a factor vector for months of the year
data <- c("Jan", "Dec", "Apr", "Sep") #the data we'd like to make a factor

#a vector of all possible levels that data can take on
month_levels <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
                  "Aug", "Sep", "Oct", "Nov", "Dec")

#create the factor variable
mon_factor <- factor(data, levels = month_levels)

#the above will treat the levels as defined by month_levels

#the following will just take unique values from the original vector
mon_factor_short <- factor(data)


#making a factor from data that is not included in the possible levels
#will create an NA

data2 <- c("Jam", "Dec", "Apr", "Maz")
mon_factor_NA <- factor(data2, levels = month_levels)

mon_factor_no_NAs <- factor(data2) #creates misspelled levels

##throw a warning whenever there is an unrecognized level in the data
parse_factor(data2, levels = month_levels)

##Automatically, factor() will order levels in alphabetical order if no
#levels are specified. If you'd like to order the levels according
#to when they first appear, set the levels to be the unique() values
#in the data.

mon_factor_short <- factor(data) #alphabetical order
mon_factor_app <- factor(data, levels = unique(data))

#if you want look at the levels of a factor, use levels() command
levels(mon_factor_app)

#overriding the current order of levels
levels(mon_factor_app) <- c("Dec", "Jan", "Sep", "Apr")


##Playing around with a data set
data.set <- gss_cat
str(data.set)

#get an overall count of each level in a factor
#let's do this for the race factor in the data.set
count(data.set, race)

count(data.set, denom)


#Re-ordering a factor according to another variable
#example - re-order the religion factor in order of the number of tvhours
fct_reorder(data.set$relig, data.set$tvhours)

#creating a summary of religion according to tvhours
relig_summary <- gss_cat %>%
  group_by(relig) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )

#plot with factors not ordered
ggplot(relig_summary, aes(tvhours, relig)) + geom_point()

#plot with re-ordered factors in religion
ggplot(relig_summary, aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()


##re-naming levels using the fct_recode() function
#this is an important part of nice visualization 

#example with partyid
count(data.set, partyid)

#re-label these party ids to be a little more clear
mutate.1 <- mutate(data.set, partyid = fct_recode(partyid,
                              "Republican, strong"    = "Strong republican",
                              "Republican, weak"      = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak"        = "Not str democrat",
                              "Democrat, strong"      = "Strong democrat"
  ))

count(mutate.1, partyid)


#collapsing a lot of levels to be more simple label names
#here, we collapse multiple levels into the levels "other", "rep", "ind", and "dem"
new.partyid = fct_collapse(data.set$partyid,
                       other = c("No answer", "Don't know", "Other party"),
                       rep = c("Strong republican", "Not str republican"),
                       ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                       dem = c("Not str democrat", "Strong democrat"))