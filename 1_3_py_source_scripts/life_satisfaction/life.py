import os
import numpy as np
import pandas as pd

datapath = os.path.join("dataset", "")

# read in data files
oecd_bli = pd.read_csv(datapath + "oecd_bli_2015.csv", thousands=',')
gdp_per_capita = pd.read_csv(datapath + "gdp_per_capita.csv",thousands=',',delimiter='\t',
                             encoding='latin1', na_values="n/a")

# filter on inequality = TOT
oecd_bli = oecd_bli[oecd_bli["INEQUALITY"]=="TOT"]

# pivot table country=row; indicator=col
oecd_bli = oecd_bli.pivot(index="Country", columns="Indicator", values="Value")

# rename 2015 column
gdp_per_capita.rename(columns={"2015": "GDP per capita"}, inplace=True)

# set index
gdp_per_capita.set_index("Country", inplace=True)

# join df's 
full_country_stats = pd.merge(left=oecd_bli, right=gdp_per_capita,
                                  left_index=True, right_index=True)

# sort by GDP per capita
full_country_stats.sort_values(by="GDP per capita", inplace=True)

# rows (countries) to remove
remove_indices = [0, 1, 6, 8, 33, 34, 35]

# rows (countries) to keep
keep_indices = list(set(range(36)) - set(remove_indices))

# subset to 2 cols
full_country_stats = full_country_stats[["GDP per capita", 'Life satisfaction']].iloc[keep_indices]
