# ---
# Calling Python from R
# https://rstudio.github.io/reticulate/articles/calling_python.html
# ---

library(reticulate)

# Type conversions --------------------------------------------------------

# R           Python
# --          ------
# Vector      Scalar
# Vector      List 
# List        Tuple
# Named list  Dict
# Matrix      NumPy ndarray
# Data frame  Pandas DataFrame
# NULL        None
# TRUE        True

# Python versions ---------------------------------------------------------

use_virtualenv()
use_condaenv()

# Import modules ----------------------------------------------------------

difflib <- import("difflib")
difflib$ndiff("foo", "bar")
# <generator object Differ.compare at 0x7f5b3cacec80>

filecmp <- import("filecmp")
filecmp$cmp('feather.py', 'feather.R')
# [1] FALSE

main <- import_main()

bi <- import_builtins()
bi$print('foo')
# foo

# Source scripts ----------------------------------------------------------

source_python("add.py")
add(5, 10)

# Execute code ------------------------------------------------------------

py_run_file("add.py")

py_run_string("x = 10")

# access py main module
py$x
# [1] 10

# Object conversion -------------------------------------------------------

# import numpy w no auto-convert to R
np <- import("numpy", convert = F)

# returns py list objects
a <- np$array(c(1:4))
sum <- a$cumsum()

# convert to r
py_to_r(sum)
# [1]  1  3  6 10

# Get help ----------------------------------------------------------------

os <- import("os")
py_help(os$chdir)

# Lists, tuples, dictionaries ---------------------------------------------

# if py requires a list item
indexes = list(42L)

# if py requires a tuple
tuple("a", "b", "c")

# explicit py dict
dict(foo = "bar", index = "42L")

