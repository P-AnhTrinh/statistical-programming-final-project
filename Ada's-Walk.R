AdaWalk <- function(){
  #at A_0
  x <- 0
  y <- 0
  xpos <- c() #x coordinates of each move
  ypos <- c() #y coordinates of each move
  xpos[1] <- 0
  ypos[1] <- 0
  for (i in 1:100){ # final position is A_100
    r <- runif(1) #random uniform numbers
    if (r <= 0.25){
      x <- x + 1 #move right
    }
    if (r > 0.25 & r <= 0.5){
      x <- x - 1 #move left
    }
    if (r > 0.5 & r <= 0.75){
      y <- y + 1 #move up
    }
    if(r > 0.75){ 
      y <- y - 1 #move down
    }
    xpos[i+1] <- x #update into the vector xpos
    ypos[i+1] <- y #update into the vector ypos
    if (xpos[i+1] == xpos[i] & ypos[i+1] == ypos[i]) #A_t != A_{t+1}
      break
    if(xpos[i+1] == 0 & ypos[i+1] == 0){ #if Ada is back in position (0,0)
      break
    }
  }
  return(rbind(xpos,ypos))
}
AdaWalk()

#example 1
A1 <- AdaWalk()
x1 <- A1[1,]
y1 <- A1[2,]
x1.min <- min(x1)
x1.max <- max(x1)
y1.min <- min(y1)
y1.max <- max(y1)

par(mfrow = c(2,2))

plot(x1, y1, type="l", xlab="x", ylab = "y", main = "Example 1", 
     xlim = range(x1.min:x1.max), ylim = range(y1.min:y1.max))
points(cbind(0,0),pch=1,col="red")
points(cbind(A1[1,ncol(A1)],A1[2,ncol(A1)]),pch=1,col="red")

#example 2
A2 <- AdaWalk()
x2 <- A2[1,]
y2 <- A2[2,]
x2.min <- min(x2)
x2.max <- max(x2)
y2.min <- min(y2)
y2.max <- max(y2)

plot(x2, y2, type="l", xlab="x", ylab = "y", main = "Example 2", 
     xlim = range(x2.min:x2.max), ylim = range(y2.min:y2.max))
points(cbind(0,0),pch=1,col="red")
points(cbind(A2[1,ncol(A2)],A2[2,ncol(A2)]),pch=1,col="red")

#example 3
A3 <- AdaWalk()
x3 <- A3[1,]
y3 <- A3[2,]
x3.min <- min(x3)
x3.max <- max(x3)
y3.min <- min(y3)
y3.max <- max(y3)

plot(x3, y3, type="l", xlab="x", ylab = "y", main = "Example 3", 
     xlim = range(x3.min:x3.max), ylim = range(y3.min:y3.max))
points(cbind(0,0),pch=1,col="red")
points(cbind(A3[1,ncol(A3)],A3[2,ncol(A3)]),pch=1,col="red")

#example 4
A4 <- AdaWalk()
x4 <- A4[1,]
y4 <- A4[2,]
x4.min <- min(x4)
x4.max <- max(x4)
y4.min <- min(y4)
y4.max <- max(y4)

plot(x4, y4, type="l", xlab="x", ylab = "y", main = "Example 4", 
     xlim = range(x4.min:x4.max), ylim = range(y4.min:y4.max))
points(cbind(0,0),pch=1,col="red")
points(cbind(A4[1,ncol(A4)],A4[2,ncol(A4)]),pch=1,col="red")

#Estimate the probability that Ada comes back to the orgin (0, 0) in at most 
#100 steps. Use a Monte Carlo simulation with at least 100 repeated experiments
#(or more, if your computer can)
n.mc <- 199
success <- 0

x <- 0
y <- 0
xpos <- c() #x coordinates of each move
ypos <- c() #y coordinates of each move
xpos[1] <- 0
ypos[1] <- 0

for (i.mc in 1:n.mc){
  flag <- F
  for (i in 1:100){ # final position is A_100
    r <- runif(1) #random uniform numbers
    if (r <= 0.25){
      x <- x + 1 #move right
    }
    if (r > 0.25 & r <= 0.5){
      x <- x - 1 #move left
    }
    if (r > 0.5 & r <= 0.75){
      y <- y + 1 #move up
    }
    if(r > 0.75){ 
      y <- y - 1 #move down
    }
    xpos[i+1] <- x #update into the vector xpos
    ypos[i+1] <- y #update into the vector ypos
    if (i <= 100 & xpos[i+1] == 0 & ypos[i+1] == 0 & !flag){
      flag <- T
      success <- success + 1
    }
    if (xpos[i+1] == xpos[i] & ypos[i+1] == ypos[i]){ #A_t != A_{t+1}
      break
    }
    if(xpos[i+1] == 0 & ypos[i+1] == 0){ #if Ada is back in position (0,0)
      break
    }
    # if (i <= 100 & xpos[i+1] == 0 & ypos[i+1] == 0 & !flag){
    #   flag <- T
    #   success <- success + 1
    # }
  }
}
cat("The estimated probability of X that Ada comes back to the orgin (0, 0) 
in at most 100 steps is", success/n.mc, "and the number of steps are", success)