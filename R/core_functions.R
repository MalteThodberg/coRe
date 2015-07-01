#' Test function
#'
#' Print hello world and return list
#'
#' @param x the first number
#' @param y the second number
#' @return list
#' @author  Malte Thodberg
#' @details Comments for basic function
#' @export

hello1 <- function(x, y) {
	print("Hello, world!")
	list(x, y)
}

#' Common Packages
#'
#' Simply return a vector with names of most commen packages
#'
#' @return Character vector
#' @author Malte Thodberg
#' @details
#' The list of packages includes:
#'
#' Data manipulation: magrittr, readr, tidyr, dplyr
#'
#' Special data formats: stringr, lubridate
#'
#' Plotting: grid, gridExtra, ggplot2, GGally, ggthemes, ggExtra, RColorBrewer, VennDiagram, pheatmap
#'
#' Performance: parallel
#' @export
core_packages <- function(){
	c("magrittr", "readr", "tidyr", "dplyr", # Data manipulation
		"stringr", "lubridate", # Special data formats
		"grid", "gridExtra", "ggplot2", "GGally", "ggthemes", "ggExtra", "RColorBrewer", "VennDiagram", "pheatmap",	# Plotting
		"parallel") # Performance
}

#' Silently add packages
#'
#' Load packages without any info returned
#'
#' @param packages character vector of package names
#' @author Malte Thodberg
#' @details Uses invisible() and supressPackageStartMessages() to silently load the packages.
#' @export
silent_library <- function(packages){
	invisible(sapply(packages, function(x) suppressPackageStartupMessages(require(x, character.only=TRUE))))
}


#' Short length
#'
#' Shorter call to length
#'
#' @return Similar to length()
#' @author Malte Thodberg
#' @details Similar to length()
#' @seealso \code{\link{length}}
#' @export
l <- base::length

#' Short head
#'
#' Shorter call to head
#'
#' @return Similar to head()
#' @author Malte Thodberg
#' @details Similar to head()
#' @seealso \code{\link{head}}
#' @export
h <- utils::head

#' Head and tail
#'
#' Show the first and last few rows of a dataframe or matrix.
#' @param d dataframe or matrix
#' @param n number of rows from head and tail
#' @return dataframe a matrix with n*2 rows from head and tail
#' @author Malte Thodberg
#' @details Wraps head and tail with rbind for convenience.
#' @seealso \code{\link{head}} \code{\link{tail}}
#' @export
ht <- function(d, n=5) rbind(head(d,n),tail(d,n))

#' Row-wise standard deviations
#'
#' Calculates standard deviation for every row in dataframe or matrix
#' @param d dataframe or matrix
#' @return numeric vector
#' @author Malte Thodberg
#' @details Wraps sd() with apply()
#' @seealso \code{\link{apply}} \code{\link{sd}}
#' @export
rowSds <- function(d) apply(d, 1, sd)

#' Row-wise variances
#'
#' Calculates variance for every row in dataframe or matrix
#' @param d dataframe or matrix
#' @return numeric vector
#' @author Malte Thodberg
#' @details Wraps var() with apply()
#' @seealso \code{\link{apply}} \code{\link{var}}
#' @export
rowVars <- function(d) apply(d, 1, var)

#' Column-wise standard deviations
#'
#' Calculates standard deviation for every column in dataframe or matrix
#' @param d dataframe or matrix
#' @return numeric vector
#' @author Malte Thodberg
#' @details Wraps sd() with apply()
#' @seealso \code{\link{apply}} \code{\link{sd}}
#' @export
colSds <- function(d) apply(d, 2, sd)

#' Column-wise variances
#'
#' Calculates variance for every column in dataframe or matrix
#' @param d dataframe or matrix
#' @return numeric vector
#' @author Malte Thodberg
#' @details Wraps var() with apply()
#' @seealso \code{\link{apply}} \code{\link{var}}
#' @export
colVars <- function(d) apply(d, 2, var)

#' Manual color gradient from values.
#'
#' Given a numeric vector, this function creates a vector of colors scaled to the values.
#' @param x numeric vector
#' @param palette color palette (rainbow, terrain, heat or topo)
#' @param levels number of different colors.
#' @return character vector containing RGB values
#' @author Malte Thodberg
#' @details This function is usefull for creating color gradients for use with base plotting.
#' @seealso \code{\link{rainbow}} \code{\link{terrain}} \code{\link{heat}} \code{\link{topo}}
#' @export
cRamp <- function(x, palette="rainbow", levels=10){
	# Defined inside to not clutter workspace
	range01 <- function(x)(x-min(x))/diff(range(x))

	# Actual function
	if(palette == "rainbow"){
		cols <- colorRamp(rainbow(levels))(range01(x))
	}else if(palette == "terrain"){
		cols <- colorRamp(terrain.colors(levels))(range01(x))
	}else if(palette == "heat"){
		cols <- colorRamp(heat.colors(levels))(range01(x))
	}else if(palette == "topo"){
		cols <- colorRamp(topo.colors(levels))(range01(x))
	}else{
		print("WRONG PALETTE!")
	}

	# Apply
	o <- apply(cols, 1, function(xt)rgb(xt[1], xt[2], xt[3], maxColorValue=255))

	# Return
	o
}

#' Detect whether the script is run locally or on server
#'
#' This function detects via username whether the script is run from a server or locally with the server system mounted.
#'
#' @return Character vector
#' @author Malte Thodberg
#' @details This function basically returns a string with "~/server" if the user (as detected by Sys.info) is "malte" or "maltethodberg". This is useful when constructing file paths, since the same code will still get correct files if mounted via sshfs.
#' @export
run_loc <- function(){
	# Determine the user name
	user_name <- Sys.info()[["user"]]

	# Pick the appropriate filesystem location
	if(user_name == "malte"){
		o <- file.path("~/server")
	}else if(user_name == "maltethodberg"){
		o <- file.path("~/server")
	}else{
		o <- file.path("")
	}

	return(o)
}
