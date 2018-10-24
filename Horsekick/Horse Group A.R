horse <- c(144, 91, 32, 11, 2)
expected <- 280 * dpois(0:4,1)
val1 <- sum((horse - expected)^2 / expected)
pchisq(val1, 4, lower.tail = FALSE)

#lambda is mean
#SE is sqrt(lambda)

lambda <- .7
se <- sqrt(lambda) / sqrt(280)
c(lambda+se*1.96,lambda-se*1.96)