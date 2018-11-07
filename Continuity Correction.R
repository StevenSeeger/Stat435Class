#Correction For Continuity
bData <- rbinom(1000,10,.5)

histGraph <- hist(bData)

histGraph$counts <- histGraph$counts/1000

barplot(histGraph$counts)

q <- seq(0,10, by = .01)
abline(q, dnorm(c(q), 5, sqrt(2.5)))

#As we can see, the Normal Dist cannot be exactly used for discrete
# data and distributions.

#Add 1/2 when using the Normal Dist to account for the loss and
# stuff to the counts

#What do we do with 0's, well they turn into 0.5.

#We could add 1/r (r being the number of columns/outcomes
# in the data)
# This is equal to adding one person to each population

#Main Lesson
# Check for structered zeros
