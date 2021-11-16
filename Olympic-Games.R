#read the data and store in a data frame speed.data
speed.data <- read.table("speed.txt", header = TRUE)

#print the first 5 rows
speed.data[1:5, ]

#calculate the average speed (in m/s)
Speed <- speed.data$Distance.100 * 100 / speed.data$Time

#add this data as a new column
modified.speed.data <- cbind(speed.data, Speed)
modified.speed.data

#print the first 5 rows of the modified data
modified.speed.data[1:5, ]

#sort the data by increasing value of year
sorted.data <- modified.speed.data[order(modified.speed.data$Year), ]
sorted.data

#print the first 10 rows of the sorted data
sorted.data[1:10, ]

#create a new data frame containing 2 columns
speed.year <- data.frame("Year"=modified.speed.data$Year,
                         "Speed"=modified.speed.data$Speed)
speed.year

#plot the speed as a function of the year
plot(speed.year$Year, speed.year$Speed, xlab = "Year",
     ylab = "Speed")

lm(speed.year$Speed ~ speed.year$Year)

plot(speed.year$Year, speed.year$Speed, abline(lm(speed.year$Speed ~ speed.year$Year)), xlab = "Year",
     ylab = "Speed")

#compute the residuals i.e. the differences between the actual average speed 
#and the speed predicted by the best fitting line
predicted.speed <- -13.01660 + 0.01082 * speed.year$Year

Residual <- abs(speed.year$Speed - predicted.speed)

#to find residual each year, first we have to sort by increasing value of year
#then calculate sum of all residuals of each year
speed.year <- cbind(speed.year, Residual)
sorted.speed.year <- speed.year[order(speed.year$Year),]
i=1
residual <- c()
while (i<=92){
  res <- sum(sorted.speed.year$Residual[i:(i+3)])
  residual <- c(residual,res)
  i=i+4
}

# the original matrix A from which QR was constructed
A <- qr.X(lm(speed.year$Speed ~ speed.year$Year)$qr)
#using qr solve
qr.solve(A, speed.year$Speed)

qqplot(modified.speed.data$Speed, modified.speed.data$Altitude, xlab = "Speed", ylab = "Altitude")

cor.test(modified.speed.data$Speed, modified.speed.data$Altitude)$p.value

#histogram
hist(residual, xlab = "Residual of Each Year", main = "Histogram of the Residuals")

qqnorm(residual)