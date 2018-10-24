# CODE AT: https://plot.ly/r/2D-Histogram/

library(plotly)

s <- matrix(c(1, -.75, -.75, 1), ncol = 2)
obs <- mvtnorm::rmvnorm(500, sigma = s)
p <- plot_ly(x = obs[,1], y = obs[,2])
pp <- subplot(
  p %>% add_markers(alpha = 0.2),
  p %>% add_histogram2d()
)

pp

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
# chart_link = api_create(pp, filename="histogram2d-basic")
# chart_link
