EvalPoly <- function(c, x){
  p <- 0
  for (i in 1:length(c)){
    p <- p + c[i] * x^(i-1)
  }
  return (p)
}

EvalPoly(c(1, -1.7, 0, 3.5), 13.4)

PolyDerEval <- function(c, x){
  p <- 0
  for (i in 2: length(c)){
    p <- p + (i-1)*c[i]*x^(i-2)
  }
  return(p)
}

PolyDerEval(c(1, -1.7, 0, 3.5), 13.4)

NewtonPoly <- function(c, x0, TOL){
  k <- 1
  approxi <- c(x0)
  while (abs(EvalPoly(c, x0)) > TOL & k <= 1000){
    x <- x0 - EvalPoly(c, x0)/PolyDerEval(c,x0) #newton's method
    k <- k + 1
    approxi <- c(approxi,x)
    x0 <- x
    
  }
  return(approxi)
}

#print the sequence of approximations by Newton's method
NewtonPoly(c(2.3, -7.1, 0, 1), -1, 10^-10)

iter <- c()
for (k in 2:10){
  #number of iterations needed by Newton's method
  iter <- c(iter, length(NewtonPoly(c(rep(0,k),1), 1, 1e-12)))
  #since x^2 = 0 + 0x + 1x^2
  #      x^3 = 0 + 0x + 0x^2 + 1x^3 
  #      x^4 = 0 + 0x + 0x^2 + 0x^3 + 1x^4 etc
}

plot(2:10, iter, xlab = "Exponent k", ylab = "Number of iterations")

PolyDer2Eval <- function(c, x){
  p <- 0
  for (i in 3: length(c)){
    p <- (i-2)*(i-1)*c[i]*x^(i-3)
  }
  return(p)
}

PolyDer2Eval(c(1, -1.7, 0, 3.5), 13.4)

ModifiedNewtonPoly <- function(c, x0, TOL){
  k <- 1
  approxi <- c(x0)
  while (abs(EvalPoly(c, x0)) > TOL & k <= 1000){
    x <- x0 - 
      (EvalPoly(c,x0) * PolyDerEval(c,x0)) / 
      ((PolyDerEval(c,x0))^2 - EvalPoly(c,x0) * PolyDer2Eval(c,x0)) #modified newton's method
    k <- k + 1
    approxi <- c(approxi,x)
    x0 <- x
  }
  return(approxi)
}

iter <- c()
for (k in 2:10){
  #number of iterations needed by Modified Newton's method
  iter <- c(iter, length(ModifiedNewtonPoly(c(rep(0,k),1), 1, 1e-12)))
  #since x^2 = 0 + 0x + 1x^2
  #      x^3 = 0 + 0x + 0x^2 + 1x^3 
  #      x^4 = 0 + 0x + 0x^2 + 0x^3 + 1x^4 etc
}

plot(2:10, iter, xlab = "Exponent k", ylab = "Number of iterations")