# #' Common Packages
# #'
# #' Simply return a vector with names of most common packages. Let's see if this is pushed
# #'
# #' @return Character vector
# #' @author Malte Thodberg
# #' @details
# #' The list of packages includes:
# #'
# #' Data manipulation: magrittr, readr, tidyr, dplyr
# #'
# #' Special data formats: stringr, lubridate
# #'
# #' Plotting: grid, gridExtra, ggplot2, GGally, ggthemes, ggExtra, RColorBrewer, VennDiagram, pheatmap, wesanderson
# #'
# #' Performance: parallel
# #' @export
# core_packages <- function(){
# 	c("magrittr", "readr", "tidyr", "dplyr", # Data manipulation
# 		"stringr", "lubridate", # Special data formats
# 		"grid", "gridExtra", "ggplot2", "GGally", "ggthemes", "ggExtra", "RColorBrewer", "VennDiagram", "pheatmap",	"wesanderson", "viridis",# Plotting
# 		"matrixStats", "parallel") # Performance
# }
#
# #' Bioconductor Packages
# #'
# #' Simply return a vector with names of bioconductor packages
# #'
# #' @return Character vector
# #' @author Malte Thodberg
# #' @details
# #' The list of packages includes:
# #'
# #' Installer: BiocInstaller
# #'
# #' Genomic Arithmetic: Biostrings, IRanges, GenomicRanges, rtracklayer
# #'
# #' Differential Expression: limma, edgeR, DESeq2
# #'
# #' Performance: parallel
# #' @export
# bioc_packages <- function(){
# 	c("BiocInstaller", # Package manager
# 		"Biostrings", "IRanges", "GenomicRanges", "SummarizedExperiment", "rtracklayer", # Genomic Arithmetic,
# 		"limma", "edgeR", "DESeq2" # DE analysis
# 	)
#
# }
#
# #' Development Packages
# #'
# #' Simply return a vector with names of packages used for development
# #'
# #' @return Character vector
# #' @author Malte Thodberg
# #' @details
# #' The list of packages includes:
# #'
# #' Development: Rccp, devtools, roxygen2, pryr, profr
# #'
# #' RStudio: rstudioapi, manipulate
# #'
# #' Terminal: setwidth, colorout
# #' @export
# code_packages <- function(){
# 	c("Rcpp", "devtools", "roxygen2", "pryr", "profr", "asserthat", # Development
# 		"rstudioapi", "manipulate", # RStudio
# 		"setwidth", "colorout") # Terminal
# }
#
# #' Silently add packages
# #'
# #' Load packages without any info returned
# #'
# #' @param packages character vector of package names
# #' @author Malte Thodberg
# #' @details Uses invisible() and supressPackageStartMessages() to silently load the packages.
# #' @export
# silent_library <- function(packages){
# 	invisible(sapply(packages, function(x) suppressPackageStartupMessages(require(x, character.only=TRUE))))
# }
#
# #' Setup R
# #'
# #' Load common packages and remove stringsAsFactors.
# #'
# #' @author Malte Thodberg
# #' @details Silently loads packages from core_packages() and bioc_packages(), deactivates stringsAsFactors and gets bioconductor source URL for package manager
# #' @seealso \code{\link{create_Rprofile}} \code{\link{core_packages}} \code{\link{bioc_packages}}
# #' @export
# setup_R <- function(){
# 	# Disable stringsAsFactors
# 	options(stringsAsFactors = FALSE)
#
# 	# Update repository manager
# 	source("http://bioconductor.org/biocLite.R")
#
# 	# Silently load packages
# 	silent_library(core_packages())
# 	silent_library(bioc_packages())
# }
#
# #' Short length
# #'
# #' Shorter call to length
# #'
# #' @return Similar to length()
# #' @author Malte Thodberg
# #' @details Similar to length()
# #' @seealso \code{\link{length}}
# #' @export
# l <- base::length
#
# #' Short head
# #'
# #' Shorter call to head
# #'
# #' @return Similar to head()
# #' @author Malte Thodberg
# #' @details Similar to head()
# #' @seealso \code{\link{head}}
# #' @export
# h <- utils::head
#
# #' Head and tail
# #'
# #' Show the first and last few rows of a dataframe or matrix.
# #' @param d dataframe or matrix
# #' @param n number of rows from head and tail
# #' @return dataframe a matrix with n*2 rows from head and tail
# #' @author Malte Thodberg
# #' @details Wraps head and tail with rbind for convenience.
# #' @seealso \code{\link{head}} \code{\link{tail}}
# #' @export
# ht <- function(d, n=5) rbind(head(d,n),tail(d,n))
#
# #' Row-wise standard deviations
# #'
# #' Calculates standard deviation for every row in dataframe or matrix
# #' @param d dataframe or matrix
# #' @return numeric vector
# #' @author Malte Thodberg
# #' @details Wraps sd() with apply()
# #' @seealso \code{\link{apply}} \code{\link{sd}}
# #' @export
# rowSds <- function(d) apply(d, 1, sd)
#
# #' Row-wise variances
# #'
# #' Calculates variance for every row in dataframe or matrix
# #' @param d dataframe or matrix
# #' @return numeric vector
# #' @author Malte Thodberg
# #' @details Wraps var() with apply()
# #' @seealso \code{\link{apply}} \code{\link{var}}
# #' @export
# rowVars <- function(d) apply(d, 1, var)
#
# #' Column-wise standard deviations
# #'
# #' Calculates standard deviation for every column in dataframe or matrix
# #' @param d dataframe or matrix
# #' @return numeric vector
# #' @author Malte Thodberg
# #' @details Wraps sd() with apply()
# #' @seealso \code{\link{apply}} \code{\link{sd}}
# #' @export
# colSds <- function(d) apply(d, 2, sd)
#
# #' Column-wise variances
# #'
# #' Calculates variance for every column in dataframe or matrix
# #' @param d dataframe or matrix
# #' @return numeric vector
# #' @author Malte Thodberg
# #' @details Wraps var() with apply()
# #' @seealso \code{\link{apply}} \code{\link{var}}
# #' @export
# colVars <- function(d) apply(d, 2, var)
#
# #' Manual color gradient from values.
# #'
# #' Given a numeric vector, this function creates a vector of colors scaled to the values.
# #' @param x numeric vector
# #' @param palette color palette (rainbow, terrain, heat or topo)
# #' @param levels number of different colors.
# #' @return character vector containing RGB values
# #' @author Malte Thodberg
# #' @details This function is usefull for creating color gradients for use with base plotting.
# #' @seealso \code{\link{rainbow}} \code{\link{terrain.colors}} \code{\link{heat.colors}} \code{\link{topo.colors}}
# #' @export
# cRamp <- function(x, palette="rainbow", levels=10){
# 	# Defined inside to not clutter workspace
# 	range01 <- function(x)(x-min(x))/diff(range(x))
#
# 	# Actual function
# 	if(palette == "rainbow"){
# 		cols <- colorRamp(rainbow(levels))(range01(x))
# 	}else if(palette == "terrain"){
# 		cols <- colorRamp(terrain.colors(levels))(range01(x))
# 	}else if(palette == "heat"){
# 		cols <- colorRamp(heat.colors(levels))(range01(x))
# 	}else if(palette == "topo"){
# 		cols <- colorRamp(topo.colors(levels))(range01(x))
# 	}else{
# 		print("WRONG PALETTE!")
# 	}
#
# 	# Apply
# 	o <- apply(cols, 1, function(xt)rgb(xt[1], xt[2], xt[3], maxColorValue=255))
#
# 	# Return
# 	o
# }
#
# #' Detect whether the script is run locally or on server
# #'
# #' This function detects via username whether the script is run from a server or locally with the server system mounted.
# #'
# #' @return Character vector
# #' @author Malte Thodberg
# #' @details This function basically returns a string with "~/server" if the user (as detected by Sys.info) is "malte" or "maltethodberg". This is useful when constructing file paths, since the same code will still get correct files if mounted via sshfs.
# #' @export
# run_loc <- function(){
# 	# Determine the user name
# 	user_name <- Sys.info()[["user"]]
#
# 	# Pick the appropriate filesystem location
# 	if(user_name == "malte"){
# 		o <- file.path("~/server")
# 	}else if(user_name == "maltethodberg"){
# 		o <- file.path("~/server")
# 	}else{
# 		o <- file.path("")
# 	}
#
# 	return(o)
# }
#
# #' Create .Rprofile
# #'
# #' Copy a template .Rprofile to the home directory
# #'
# #' @author Malte Thodberg
# #' @details coRe/extdata contains a template for an .Rprofile file for an effective R-setup that does not influence code execution. This file will try to adapt startup settings to whether R is run from a terminal or RStudio.
# #' @seealso \code{\link{setup_R}}
# #' @export
# create_Rprofile <- function(){
# 	# Files
# 	template_fname <- file.path(find.package("coRe"), "extdata/template.R")
# 	to_fname <- file.path("~/.Rprofile")
#
# 	# Copy file as safely as possibly
# 	file.copy(from=template_fname, to=to_fname, overwrite=FALSE, recursive=FALSE)
# 	}
#
# #' The Keep Function
# #'
# #' Modified from https://github.com/flor3652/myStuff/blob/master/R/keep.R. This function is designed to keep a given list of variables (as opposed to the rm function, which is designed to remove a list of variables). In addition to the original code, it also forces a gc() garbage collection.
# #'
# #' @param ... Variables that should stay in the environment
# #' @param x A character vector of variables which you wish to keep
# #' @details The function uses the \code{ls} command to find the variables that are defined in the global environment. It then deletes all variables that are not given as an argument.
# #' @author Michael Floren
# #' @seealso \code{\link{rm}} \code{\link{ls}} \code{\link{gc}}
# #' @export
# keep <- function(...,x=c()){
#   # Check if keep variables have been given
# 	if(length(x)){
# 		if(!is.character(x)) stop("x must contain character vector")
# 		rm(list=ls(name=.GlobalEnv)[!ls(name=.GlobalEnv)%in%x], pos=.GlobalEnv)
# 		return(invisible(ls(name=.GlobalEnv)))
# 	}
#
# 	# Parse dots
# 	dots <- match.call(expand.dots=FALSE)$...
#
# 	if (length(dots) && !all(sapply(dots, function(x) is.symbol(x) ||
# 																	is.character(x))))
# 		stop("... must contain names or character strings")
#
# 	names <- sapply(dots,as.character)
#
# 	# Remove all variables, except marked ones
# 	rm(list=ls(name=.GlobalEnv)[!ls(name=.GlobalEnv) %in% names], pos=.GlobalEnv)
#
# 	# Force garbage collection
# 	gc()
#
# 	# Invisibly return kept values
# 	invisible(ls(name=.GlobalEnv))
# }
#
# #' Deep cleaning of workspace
# #'
# #' Removes all variables in workspace and forces garbage collection.
# #'
# #' @details Uses \code{rm()} to remove all variables from \code{ls()} and collects garbage with \code{gc()}
# #' @return Output from \code{gc()}
# #' @author Malte Thodberg
# #' @seealso \code{\link{rm}} \code{\link{ls}} \code{\link{gc}}
# #' @export
# clear <- function(){
# 	# Remove all variables in global enviroment
# 	rm(list=ls(name=.GlobalEnv), pos=.GlobalEnv)
#
# 	# Force garbage collection
# 	gc()
# }
