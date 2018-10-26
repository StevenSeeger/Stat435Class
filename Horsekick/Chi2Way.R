#Reading in R Binary Files
load("data1.RData")

summary(xyz)
sjs <- table(xyz)

apply(sjs, 2, sum)

#Prob of being in different categories assuming 1 pop
apply(sjs, 2, sum) / 3000

#Expected value for each category
HKev <- (apply(sjs, 2, sum) / 3000) * 1000

#Observed - expected values
##Only doing the first row because of the way r stores things. (Was orginially doing columns)
sjs[1,] - HKev

#This creates the chi value for each of the values
chiVal <- apply(sjs, 1, function(x)
  {
  (x - HKev)/sqrt(HKev)
})

#Creating ChiSq Values and p-values
chisqVal<- sum(chiVal^2)
#Calc degrees of freedom
dof <- prod(dim(sjs) - 1)

pchisq(chisqVal, 6, lower.tail = FALSE)

#Expected Value of Chi-sq is n
#Variance is 2n






