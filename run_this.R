
library(plumber)
library(rmarkdown)

r <- plumb("plumber.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)