# ---
# Import Python modules
# ---

library(reticulate)

# Import module -----------------------------------------------------------

os <- import("os")


# Call function -----------------------------------------------------------

os$listdir(".")



