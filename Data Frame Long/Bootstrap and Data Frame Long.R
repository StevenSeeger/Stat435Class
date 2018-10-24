#Creating a Data Set; I am going to create a dataset that has 60 observations in each run
#This means two groups. Group 1 and Group 2, each with 30 observations

data <- rnorm(60, mean=0, sd=1)

#Now I am going to simulate creating a dataset using a psuedo boot-strap

nsims = 1000

dataF1 <- NULL

#Creates a psuedo bootstrap of nsims
for (i in 1:nsims)
{
  index <- sample(1:60,60, replace = TRUE) #Change this to False to be a permutation test
  group <- data[index]
  dataF1 <- c(dataF1, group)
}

library(reshape2)

#Convert to Matrix
dataMatrix <- matrix(dataF1, nrow=nsims)

#Adding names to the Matrix; 1:30 because 30 in each group
colnames(dataMatrix) <- c(paste("g1_",1:30,sep=""),paste("g2_",1:30,sep=""))

#Converting back to data frame to reshape it
dataF2 <- data.frame(id = c(1:nsims), dataMatrix)

#Creating the Long Data Frame
dfL <- melt(dataF2, id.vars="id")

#Substr from 1:2 because it gives us g1 and g2 at the group variable
dfL1 <- data.frame(dfL, group=substr(dfL$variable,1,2))

#From here you can export the data how you want
