# PROJECT: Snowshoe hare habitat selection simulations
# SCRIPT: 01 - Landscape setup
# BEGAN: 07 May 2026
# COMPLETED: 
# MODIFIED: 07 May 2026
# R: 4.4.3

# ______________________________________________________________________________
# 00. Purpose ----
# ______________________________________________________________________________

# determine if my HSF idea would be feasible through simulation and model testing

# ______________________________________________________________________________
# 01. Load libraries ----
# ______________________________________________________________________________

library(tidyverse)
#library(hoov)
library(sf)
library(terra)
library(NLMR)

# ______________________________________________________________________________
# 02. Define landscape parameters ----
# ______________________________________________________________________________

# landscape size (ha)
ls.area.ha <- 25

# ls size (m^2)
ls.area.m2 <- ls.area.ha * 10000

# covariate resolution (m)
resol <- 10

# length of a landscape edge (m)
ls.length <- sqrt(ls.area.m2)

# number of rows/columns
n.row <- n.col <- ls.length / resol

# total number of pixels
n.cells <- n.row * n.col

# ______________________________________________________________________________
# 03. Introduce landscape covariates ----
# ______________________________________________________________________________

# STEM
# this is something like stem density, where it's patchy and hares almost always
# select for it. I would imagine a functional relationship where you relax selection
# for it as it becomes more available
# it is heavily influenced by treatment

# CANOPY
# canopy height - there should be an optimum but we'll intentionally mis-specify it
# there should be a functional response with where the peak is, so it could recover it
# it is also influenced by treatment but less so

# SHRUB
# shrub layer - the thing I wish I had. Hares select it as it becomes more available,
# surely. A positive FR.
# not impacted much by treatment

# ***we'll make a big assumption and say these don't covary strongly

# ______________________________________________________________________________
# 04. Define landscape covariates ----
# ______________________________________________________________________________
# 04a. Functions ---- 
# ______________________________________________________________________________

# make stem layer
make_stem <- function () {
  
  # use global landscape parameters
  
  # gaussian random field from NLMR
  ls <- nlm_gaussianfield(ncol = n.col,
                          nrow = n.row,
                          resolution = resol,
                          autocorr_range = 25,
                          mag_var = 10,
                          nug = 5,
                          mean = 0.5,
                          user_seed = NULL,
                          rescale = F)
  
  plot(ls)
}


# make canopy layer
make_canopy <- function () {
  
  
  
}


# make shrub layer
make_shrub <- function () {
  
  # use global landscape parameters
  
  # 
  
}




# generate landscapes
# place "unit" in treatment landscapes
# "treat" units (also a function)
# save to file