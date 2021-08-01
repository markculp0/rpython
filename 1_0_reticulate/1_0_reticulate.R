# ---
# Reticulate
# ---

library(reticulate)

# installed python-3.6.12 

# Activate environment
# conda activate r-reticulate

# Deactivate environment
# conda deactivate

# Python version ----------------------------------------------------------

# Specify an alternate version, other than
# found in PATH 
# use_python("/usr/local/bin/python")
  
# Python packages ---------------------------------------------------------

# Use virtual or conda version
# use_virtualenv("myenv")
# use_condaenv("myenv") 

# List all available conda environments
conda_list()	

# conda_create()	Create a new conda environment
# conda_install()	Install a package within a conda environment
# conda_remove()	Remove individual packages or an entire conda environment
  
# create a new environment 
conda_create("r-reticulate")

# install pandas
conda_install("r-reticulate", "pandas")

# install SciPy
conda_install("r-reticulate", "scipy")

# import SciPy (it will be automatically discovered in "r-reticulate")
scipy <- import("scipy")

# or 

# indicate that we want to use a specific condaenv
use_condaenv("r-reticulate")

# import SciPy (will use "r-reticulate" as per call to use_condaenv)
scipy <- import("scipy")

# Calling Python ----------------------------------------------------------

# 1. Python in R Markdown 
#    * Access to objects created within Python chunks from R 
#      using the py object (e.g. py$x would access an x variable 
#      created within Python from R).

# 2. import() to call Python modules from R

# 3. source_python() function enables you to source a Python script.

# 4. repl_python() creates an interactive session w/in R

repl_python() 
