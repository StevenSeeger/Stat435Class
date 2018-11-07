load(paste(getwd(), "/Heart Disease/","x.RData", sep=""))

y <- xtabs(count ~ serum.cholesterol + systolic + heart.disease, x)

y # issue at the present, the ordered on the columns is off

ao <- rep(c("127", "137", "152", "167"), c(8,8,8,8))

ao2 <- rep(c("200", "215", "240", "260"), 8)

x$systolic <- ao
x$serum.cholesterol <- ao2

y <- xtabs(count ~ serum.cholesterol + systolic + heart.disease, x)

sjs <- loglin(y, list(c(1,2), c(1,3), c(2,3)))

#model where response doesn't interact with treatments
sjs2 <- loglin(y, list(c(1,2), c(1,3), c(2,3)), fit=TRUE)

mydata <- as.data.frame((y - sjs2$fit)/sqrt(sjs2$fit))
qqnorm(mydata$Freq)

sum(((y - sjs2$fit)/sqrt(sjs2$fit))^2)

sjs3 <- loglin(y, list(c(1,2), c(3)), fit=TRUE)

#At least one of the treatments is significant

myresid <- function(y, df)
{
  (y-df)/sqrt(df)
}

myresid(y, sjs3$fit)

#Looking at a single treatment

sum(myresid(y[,,1], sjs3$fit[,,1])^2)

sum(myresid(y[,,2], sjs3$fit[,,2])^2)

x$count <- x$count + 1/32
head(x)
x$logcount <- log(x$count)
x$serum.cholesterol <- as.factor(x$serum.cholesterol)
x$systolic <- as.factor(x$systolic)

anova(lm(logcount ~ serum.cholesterol*systolic*heart.disease, data=x, weights=x$count))
