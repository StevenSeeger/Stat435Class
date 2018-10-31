#6 populations and 2 responses

n <- 1000
lambda <- c(0.27, 0.28, 0.29, 0.3, 0.31, 0.32)


x <- c(rpois(n, lambda[1]), rpois(n, lambda[2]), rpois(n, lambda[3]), rpois(n, lambda[4]), rpois(n, lambda[5]), rpois(n, lambda[6]))

factor1 <- rep(rep(c("a", "b", "c"), rep(n, 3)),2)
factor2 <- rep(c("where", "why"), rep(n*(length(lambda)/2), 2))
factor3 <- rep(c("A", "B", "C", "D", "E", "F"), rep(n, 6))

xyz <- data.frame(group = factor1, group = factor2, data = x)

xyz1 <- table(xyz)
xyz2 <- table(data.frame(group = factor3, data = x))


loglin(xyz2, list(c(1),c(2))) #assume two margins (1 and 2) are independent; likelihood ratio test and a pearson test; not significant because it's close to the DF (expected value of chi-square is the DF); 20 not 22(sum of interactions) because we're missing data (some of the cells are zero)

lin.model2 <- loglin(xyz1, list(c(1, 2), c(1,3), c(2,3)), fit = TRUE) #fits a log-linear model
qqnorm(c(xyz1 - lin.model2$fit)/c(sqrt(lin.model2$fit)))

loglin(xyz1, list(c(1,2), c(1,3)))
lin.model3 <- loglin(xyz1, list(c(1,2), c(2,3)), fit = TRUE)
loglin(xyz1, list(c(1,3), c(2,3)))
lin.model5 <- loglin(xyz1, list(c(1), c(2),c(3)), fit = TRUE) #also tests to see if all interactions = 0
lin.model <- loglin(xyz1, list(c(1,2), c(3)), fit = TRUE)
lin.model4 <- loglin(xyz1, list(c(1, 2, 3)), fit = TRUE)  


loglin(xyz1 + 1/32, list(c(1, 2), c(1,3), c(2,3))) 
loglin(xyz1 + 1/32, list(c(1,2), c(1,3))) 
loglin(xyz1 + 1/32, list(c(1,2), c(2,3))) 
loglin(xyz1 + 1/32, list(c(1,3), c(2,3))) 
loglin(xyz1 + 1/32, list(c(1), c(2), c(3)))
loglin(xyz1 + 1/32, list(c(1,2), c(3))) 


xyz1.dataframe <- as.data.frame(xyz1)
xyz1.dataframe[,1] <- as.character(xyz1.dataframe[,1])
xyz1.dataframe[,2] <- as.character(xyz1.dataframe[,2])
xyz1.dataframe[,3] <- as.character(xyz1.dataframe[,3])

