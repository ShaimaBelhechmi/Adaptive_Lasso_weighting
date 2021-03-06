#####################################################################
# R packages installation                                           #
#####################################################################
library(grpreg)

set.seed( ) 

#biomarker groups
# group <- c(rep(1:9, each = 25), rep(10:20, each = 75))

cv.cMCP <- function(data,
                    # seed,
                    group){
  
  biom <- grep("bm", names(data))
  nbiom <- length(biom)
  X = as.matrix(data[,nbiom])
  y = as.matrix(data[,c('time','status')])
  
  cv <-
    cv.grpsurv(
      X,
      y,
      # seed = seed,
      group = group,
      nfolds = 5,
      penalty = "cMCP",
      se = c('quick'),
      returnX = TRUE,
      returnY = TRUE,
      trace = TRUE
    )
  
  
  allrescMCP <- cv
  return(allrescMCP)
  
}