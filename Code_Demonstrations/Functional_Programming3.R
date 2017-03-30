MyDataFrame_01 <- data.frame(A = c(1, 10, 7, 2, 1, 6),
                             B = c(6, 4, 9, 9, 10, 2),
                             C = c(1, 4, 5, 3, 5, 1),
                             D = c(5, -99, 4, 8, 9, 3),
                             E = c(-99, 9, 1, 6, 8, 8),
                             F = c(1, 3, 4, 8, 6, 5))

##Goal 1: Replace all -99's with NA

#create a column function
fix99s <- function(myCol){
  myCol[myCol == -99] <- NA
  return(myCol)
}

#Apply the function to all columns of MyDataFrame_01
trial1 <- apply(MyDataFrame_01, 2, fix99s)
class(trial1) #gives a matrix

trial1 <- as.data.frame(trial1)


trial2 <- lapply(MyDataFrame_01, fix99s)
class(trial2) #gives a list

trial2 <- as.data.frame(trial2)

trial3 <- sapply(MyDataFrame_01, fix99s)
class(trial3)

#Unfortunately, there are no apply functions that will return
#a data frame. So, using our awesome functional programming skills, 
#we will make one

dapply <- function(X, MARGIN = NULL, FUN, ...){
  if(class(X) == "data.frame" || class(X) == "matrix"){
    #and you supplied a MARGIN
    if(is.null(MARGIN) == FALSE){
      result <- apply(X, MARGIN = MARGIN, FUN, ...)
    }else{
      result <- sapply(X, FUN, ...)
    }
    if(class(X) == "data.frame"){
      result <- as.data.frame(result)
    }
  }
  if(class(X) == "list"){
    result <- lapply(X, FUN, ...)
  }
return(result)
}

#Trying our function
trial4 <- dapply(MyDataFrame_01, MARGIN = 2, FUN = fix99s)


##Goal: Reverse the order of the row / column
reverse.fun <- function(vector){
  vector <- vector[seq(length(vector), 1, by = -1)]
  return(vector)
}

reverse.columns <- dapply(MyDataFrame_01, MARGIN = 2, FUN = reverse.fun)
reverse.rows <- dapply(MyDataFrame_01, MARGIN = 1, FUN = reverse.fun)
#think about this... 
