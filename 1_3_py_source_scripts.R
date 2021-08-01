# ---
# Python Source Scripts
# ---

library(ggplot2)
library(reticulate)

source_python("rdata/flights.py")

flights <- read_flights("rdata/flights.csv")

ggplot(flights, aes(carrier, arr_delay)) + geom_point() +
  geom_jitter()  


    