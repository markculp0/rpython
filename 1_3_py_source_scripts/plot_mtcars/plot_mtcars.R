# Source a Python script that returns a Python DataFrame()

library(tidyverse)
library(reticulate)

source_python("plot_mtcars.py")

df <- mtplot()

ggplot(data = df, mapping = aes(x=cyl, y=mpg, group=cyl)) +
  geom_boxplot() + 
  ggtitle("Car milage as a function of cylinders") +
  xlab("number of cylinders")

ggplot(data = df, mapping = aes(x=wt, y=mpg)) +
  geom_point() +
  geom_smooth() + 
  ggtitle("Car milage as a function of weight") +
  xlab("weight")


