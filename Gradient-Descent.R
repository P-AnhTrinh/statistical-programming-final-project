#euclidean norm = sqrt((x1)^2+(x2)^2+...+(xn)^2)
euclidean.norm <- function(x){
  total = 0
  for (i in 1:length(x)){
    total = total +(x[i])^2
  }
  sqrt(total)
}

n = 1
xk <- matrix()
GradientDescent <- function(A, b, h, x0, TOL, N.max){
  gradient.f <- function(x){A %*% x + b} #formula of gradient of f(x)
  x <-  x0 - h * gradient.f(x0)
  xk <- cbind(x)
  while (euclidean.norm(x-x0) > TOL || n <= N.max){
    x0 <- x
    x <-  x0 - h*gradient.f(x0)
    xk <- cbind(xk,x)
    n <- n+1
  }
  return (xk)
}

A <- matrix(c(2,1,1,2), nrow=2)
b <- matrix(c(5,6))
x0 <- matrix(c(0,0))
GradientDescent(A, b, 0.1, x0, 1e-7, 100)
#each column represents a vector of x_k

xmin <- c(-4/3,-7/3)
xk <- GradientDescent(A, b, 0.1, x0, 1e-7, 100)
k <- ncol(xk) #number of iterations
decay <- c()
for (i in 1:k){
  decay <- c(decay, euclidean.norm(xk[i] - xmin))
}

#convergence plot
plot(1:k, decay, log = "y", xlab = "Iteration", ylab = "Decay of ||xk - xmin||_2")

m <- function(n){
  mat <- matrix(rep(0, n^2),nrow = n)
  for (i in 1:n){
    for (j in 1:n){
      if(i == j){mat[i,j] <- 2} #main diagonal
      if(i+1 == j || i-1 ==j){mat[i,j] <- -1} #first upper and lower diagonal
    }
  }
  
  return(mat)
  
}

vec <- function(n){
  c(rep(1,n))
}
m(10)
vec(10)

x0 <- matrix(c(rep(0,10)))
M <- m(10)
v <- vec(10)
xList <- GradientDescent(M, v, 0.5, x0, 1e-7, 100)
k <- ncol(xList) #number of iterations
x.min <- xList[,k] #last iteration
x.min
f <- function(x) {1/2*t(x)%*%M%*%x + t(v)%*%x + 1}
f(x.min)
