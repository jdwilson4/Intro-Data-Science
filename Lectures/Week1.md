# Week 1: Intro to R, RStudio, and the Basics of github

By **James D. Wilson**

In this first week, we will cover the basics of R, RStudio, and github. We will start with installation and go through basic commands that will be useful throughout this course.


#Part I: R and RStudio

RStudio is publicly available software for data analysis. 

##Installing RStudio

To install RStudio, you need to first download and install the most recent version of R from the CRAN website [here](https://www.r-project.org). Follow directions there to download and install the R software for your computer. 

Once R is installed, you can now download and install the most recent version of RStudio to your computer. To do this, go to [this website](https://www.rstudio.com/products/RStudio/). Note that you can download to your Desktop (which I suggest for this course) or you can use the RStudio Server to utilize RStudio from any computer with a Wifi connection. 

Rstudio provides a *graphical user interface* (GUI) for your use, where you can directly write functions or perform statistical analysis. Alternatively, you can directly call R using BASH scripting via, for example, the *Terminal* on a Mac. In this course, we will use the GUI for all calculations but if you are interested I invite you to look more into BASH scripting. A nice tutorial is provided [here](http://ryanstutorials.net/bash-scripting-tutorial/), and a BASH command cheatsheet is provided [here](https://gist.github.com/LeCoupa/122b12050f5fb267e75f).

**Keeping up to date**: Since R and RStudio is open source, contributors can freely add to the software and/or change existing packages. Because of this, it is important to keep your code and your RStudio version up to date. You will need to re-visit these sites and re-install the most recent version.


##Packages in RStudio

Researchers and other data scientists can contribute freely to the software, providing a means to share, develop, and enhance code. Generally, researchers will contribute by adding a new *package* to the existing list of available packages in R.

You can begin conducting statistical analyses without downloading or installing any packages, in which case you will be using the available functions in the *base R* environment. However, for much of what we'll be doing in this class, we will be relying on modern packages like *ggplot2*, *knitr*, *tidyr*, and *dplyr* for data wrangling, exploration, and visualization. Below we will use our first package in this course, *knitr*. 

##Using the *knitr* package for file compilation

For our first lesson, we will use the *knitr* package in RStudio, which provides a great way to demonstrate statistical analyses to others, while ensuring reproducible code. For each assignment in this course, I will require you to compile your R scripts using the *knitr* package so that I know that your code works.

To install the *knitr* package, run the following command

``` install.packages("knitr") ```

Once a package has been installed on your version of RStudio, you will never have to install it again. However, each time that you start a new instance of RStudio, you will *have* to load the library to your current instance. You can do this using one of the two following commands:

``` library(knitr) ```

or

``` require(knitr) ```

At any time, you can check your list of installed packages by running the following command:

``` installed.packages() ```

###Basics of Markdown Language

###"knitting" a File: it's all for reproducibility


#Part II: Git and Github

##What's the point?
File sharing!
##Creating an Account

##Pushing, Pulling, and Committing

##The 5 Most Useful Commands in github

##Other Useful Resources for Learning More