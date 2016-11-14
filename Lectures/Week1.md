# Week 1: Intro to R and RStudio

By **James D. Wilson**

In this first week, we will cover the basics of R and RStudio. We will start with installation and go through basic commands that will be useful throughout this course.


#Installation

##Installing R First
To install RStudio, you need to first download and install the most recent version of R from the CRAN website [here](https://www.r-project.org). Follow directions there to download and install the R software for your computer. 

##Installing RStudio
Once R is installed, you can now download and install the most recent version of RStudio to your computer. To do this, go to [this website](https://www.rstudio.com/products/RStudio/). Note that you can download to your Desktop (which I suggest for this course) or you can use the RStudio Server to utilize RStudio from any computer with a wifi connection. 

#The Graphical User Interface
Rstudio provides a *graphical user interface* (GUI) for your use, where you can directly write functions or perform statistical analysis. When you open RStudio, an application will open that looks like the following.

![RStudio Console](https://github.com/jdwilson4/Intro-Data-Science-2017/blob/master/Images/rstudio-console.png)

The **Console** is where you type code that you wish to run. All you have to do is type a command, and an output will be provided. This is actually a pretty nice calculator. For example, try the following few commands and press enter between each line:

``` 
1 + 2

log(10)

log(10, base = 10)

exp(23)

```

Notice that the answer will be automatically put in front of you at the next line of the **Console**. If you type something that is *not* a function in R, or is somehow in error, you will get a line of red that describes the error. For example, try running the following:

```
lg(2)
```

R also has an internal help log about every function that is currently available. To call upon that, you can simply put a ? before a valid function. For example, if you were curious about the *log* function we used earlier, you can simply type:

```
?log
```

Once you do this, a *documentation* file will appear to the right of the **Console** in the **Output** file. The **Output** block on the GUI will also be where plots appear. We'll explore more of this later. 

If you don't like using this GUI, you can alternatively call R using BASH scripting via, for example, the *Terminal* on a Mac. In this course, we will use the GUI for all calculations but if you are interested I invite you to look more into BASH scripting. A nice tutorial is provided [here](http://ryanstutorials.net/bash-scripting-tutorial/), and a BASH command cheat sheet is provided [here](https://gist.github.com/LeCoupa/122b12050f5fb267e75f).

**Keeping up to date**: Since R and RStudio is open source, contributors can freely add to the software and/or change existing packages. Because of this, it is important to keep your code and your RStudio version up to date. Typically, a new version of R and RStudio will be available about 2 - 3 times per year. You will need to re-visit these sites and re-install the most recent version.



#Packages in RStudio

Researchers and other data scientists can contribute freely to the software, providing a means to share, develop, and enhance code. Generally, researchers will contribute by adding a new *package* to the existing list of available packages in R. An R *package* is a collection of functions, data, and documentation that extends the capabilities of base R.

You can begin conducting statistical analyses without downloading or installing any packages, in which case you will be using the available functions in the *base R* environment. However, for much of what we'll be doing in this class, we will be relying on modern packages like *ggplot2*, *knitr*, *tidyr*, and *dplyr* for data wrangling, exploration, and visualization. Below we will use our first package in this course, *knitr*. 

For our first lesson, we will use the *knitr* package in RStudio, which provides a great way to demonstrate statistical analyses to others, while ensuring reproducible code. For each assignment in this course, I will require you to compile your R scripts using the *knitr* package so that I know that your code works.

To install the *knitr* package, run the following command

``` install.packages("knitr") ```

Once a package has been installed on your version of RStudio, you will never have to install it again. However, each time that you start a new instance of RStudio, you will *have* to load the library to your current instance. You can do this using one of the two following commands:

``` library(knitr) ```

or

``` require(knitr) ```

At any time, you can check your list of installed packages by running the following command:

``` installed.packages() ```


##Using the *knitr* package for file compilation

Now that we have the *knitr* package installed and downloaded for our R session, we can now create a file that can be compiled into an .html or a .pdf presentation file. *knitr* requires the use of the **Markdown** language, which is straightforward, once you know R functionality. 

To use *knitr*, we first need to open a Markdown file using the new file button at the top left of your RStudio GUI and clicking **R Markdown**. In other words, press the following:

![R Markdown File](https://github.com/jdwilson4/Intro-Data-Science-2017/blob/master/Images/R_Markdown.png)

Choose **Document** and then choose **HTML** as the Output Format. Note that if you would like to instead end up with a .pdf, you could alternatively choose **PDF** as your Output Format. Name the **Title**: *My First knit Experience*, and write your name under **Author** as shown below

![knit choices](https://github.com/jdwilson4/Intro-Data-Science-2017/blob/master/Images/myfirstknit.png)

The window that opens up will be a basic template, which provides some useful code and a simple tutorial of how to get started. 

##Basics of R Markdown
Before beginning, let's review a few of the most basic commands in R Markdown. Note: [x3] below means to repeat the former character 3 times. Important commands include:

- * word * : Italizes word
- ** word ** : Bolds word 
- word \n --- : Largest header for word
- word \n === : 2nd largest header for word
- ``` `[x3]{r, echo = TRUE, eval = TRUE} x = 2 `[x3] ```: runs and shows the R code x = 2
- ``` `[x3]{r, echo = FALSE, eval = TRUE} x = 2 `[x3] ```: runs the code, but does not print input x = 2
- ``` `[x3]{r, echo = TRUE, eval = FALSE} x = 2 `[x3] ```: echoes the input x = 2 but does not run the code

You can do a lot with these simple commands. In fact, any R code can be run in R Markdown simply by setting it off with the three apostrophe marks. 

For more information on what you can do with R Markdown, see the R Markdown cheat sheet [here](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf).
 

##Example: "knitting" a File: It's all for Reproducibility

An important feature of the *knitr* package is that the file **will not** compile if the R code within the file doesn't work. Thus, once you are able to *knit* a file, the outcome ensures that the R code is in fact reproducible. 

For me, this is great as it makes it much easier for me to grade whether or not your code actually works :) For you, this tells your audience that your code actually works!

Let's try a simple **Hello World** markdown example. In the following example, we will print "Hello World" and then plot a histogram of 1000 random N(0,1) data. We'll go more into these functions later, but for now type the following in your .Rmd file:

```  
---
title: "My First knit Experience"
author: "[your name]"
date: "[today's date]"
output: html_document
---

This is **my** first knit experience. First, *I* will get R to print out **Hello World,** and I will tell R to repeat my input command.

`[x3]{r, echo = TRUE, eval = TRUE}
print("Hello World")
`[x3]

Now, I'll do the same as above except I will tell R **not** to print out my input
`[x3]{r, echo = FALSE, eval = TRUE}
print("Hello World")
`[x3]

Finally, I will generate 1000 observations from a N(0,1) distribution and print the histogram of the data with 100 bins.

`[x3]{r, echo = TRUE, eval = TRUE}
data <- rnorm(n = 1000, mean = 0, sd = 1)
hist(data, n = 100)
`[x3]

```

When you are done, you can now *knit* the file to get an .html output. To do this, press the **Knit .pdf** button as shown below:

![knit](https://github.com/jdwilson4/Intro-Data-Science-2017/blob/master/Images/knit.png)

Once the file has been *knit*, if there are no bugs in your code (which there shouldn't be if you ran the above example) then you will get an .html file automatically saved to the same location of your .Rmd file. Your .html file should look something like [this](https://github.com/jdwilson4/Intro-Data-Science-2017/blob/master/Code_Demonstrations/MyFirstKnit.pdf). 


##Installing *tidyverse* for Data Science

Most of the functions that are used in the book that we will be using for this course are available in the *tidyverse* R package. This package is a compilation of packages (over 20 of them actually). Install this package by typing the following

```
install.packages("tidyverse")
```

Now before any lecture, you can make sure to use ```library(tidyverse)``` to ensure you have the needed packages available for use. 

##Other Useful Resources for Learning More about R

There is an enormous number of resources available for learning the basics of R. In particular, the blog *stackoverflow* is a useful resource for quick questions about R. 

It is important to remember that *Google* is your best friend. The steepest learning curve for R is the sheer vocabulary of possible functions that are available. So Googling is incredibly useful, especially at the beginning of your programming careers. 

You can also go to http://www.r-bloggers.com -- an R blog that is a compilation of over 500 blogs around the world. This is a great resource for reading about more recent and broad applications of R. 

#Assignment

1) Read Chapter 1 of *Doing Data Science* by Cathy O'Neil and Rachel Schutt [here](https://www.safaribooksonline.com/library/view/doing-data-science/9781449363871/ch01.html).
2) Complete Computational Assignment 1 by **Tuesday, January 31st by 9:00 AM**
