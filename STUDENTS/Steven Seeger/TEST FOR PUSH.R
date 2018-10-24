#CODE FOUND AT: https://ubuntuforums.org/showthread.php?t=1279253

# Create data 
MyData <- matrix(c(57.1, 52.3, 13.5, 13.9, 7.9, 8.8, 5.4, 5.6, 
                   16.1, 19.4), 
                 nrow = 2) 

# Note that by using '\n' in the text, the label will be plotted on 
# two lines. '\n' is a newline character 
colnames(MyData) <- c("0 occasions", "1-2 Occasions", "3-5 Occasions", 
                      "6-9 Occasions", "10 or more\nOccasions") 

rownames(MyData) <- c("Androscoggin", "Maine") 




# Set graph margins to make room for labels 
# See ?par 
par(mar = c(5, 8, 4, 1)) 


# Set colors 
MyCols <- c("black", "grey80") 


# Set label size 
MyCex = 0.75 


# Set lines for table data 
MyLines <- 2:3 


# do barplot, getting bar midpoints in 'mp' 
# See ?barplot 
mp <- barplot(MyData, beside = TRUE, ylim = c(0, 100), 
              yaxt = "n", cex.names = MyCex, col = MyCols) 


# mp contains the following. The mean of each column 
# is the horizontal center of each pair of bars 


# Put a box around it 
box() 


# Draw y axis tick marks and labels 
axis(2, at = seq(0, 100, 10), las = 1) 


# Draw values below plot 
# Use the values of 'mp' from above. 
# See ?mtext 
mtext(side = 1, text = MyData, 
      at = rep(colMeans(mp), each = nrow(MyData)), 
      line = MyLines, cex = MyCex) 


# Get min value for the x axis. See ?par 'usr' 
min.x <- par("usr")[1] 


# Draw categories using mtext 
# See ?strwidth to get the length of the labels in 
# user coordinates, which is then used for 'at' 
# Setting 'adj = 0' left justifies the text 
mtext(side = 1, line = MyLines, text = rownames(MyData), 
      at = min.x - max(strwidth(rownames(MyData), cex = MyCex)), 
      adj = 0, cex = MyCex) 


# Draw the colored boxes 
# Same here for strheight as with strwidth above 
# Part of this is getting the vertical positioning to align with 
# the text and the horizontal position at the beginning of the labels 
# Note that we have to set 'xpd = TRUE' so that the points are drawn 
# outside the plotting region. See ?par and 'xpd' 
# We just need a single capital letter for strheight() to get the value 

VertOff <- strheight("X", cex = MyCex) * c(6, 8) 
HorizOff <- min.x - (0.85 * max(strwidth(rownames(MyData)))) 

points(rep(HorizOff, nrow(MyData)), 
       par("usr")[3] - VertOff, bg = MyCols, pch = 22, 
       xpd = TRUE, cex = MyCex)