import numpy as np
import pandas as pd
def mtplot():
  cars = pd.read_csv("mtcars.csv")
  cars.columns = ['car_names', 'mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb']
  df = cars[['cyl', 'wt', 'mpg']]
  return df
  

