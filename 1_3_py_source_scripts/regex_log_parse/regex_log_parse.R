# Source a Python script that returns a Dict()

library(reticulate)

source_python("rdata/regex_log_parse.py")

# Import dict as a list
log <- get_log()
log <- as.data.frame(log)

rm(r, get_log)


