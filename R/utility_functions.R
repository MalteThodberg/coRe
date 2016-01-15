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

#' The Keep Function
#'
#' Modified from \url{https://github.com/flor3652/myStuff/blob/master/R/keep.R}. This function is designed to keep a given list of variables (as opposed to the rm function, which is designed to remove a list of variables). In addition to the original code, it also forces a gc() garbage collection.
#'
#' @param ... Variables that should stay in the environment
#' @param x A character vector of variables which you wish to keep
#' @details The function uses the \code{ls} command to find the variables that are defined in the global environment. It then deletes all variables that are not given as an argument.
#' @author Michael Floren
#' @seealso \code{\link{rm}} \code{\link{ls}} \code{\link{gc}}
#' @export
keep <- function(...,x=c()){
	# Check if keep variables have been given
	if(length(x)){
		if(!is.character(x)) stop("x must contain character vector")
		rm(list=ls(name=.GlobalEnv)[!ls(name=.GlobalEnv)%in%x], pos=.GlobalEnv)
		return(invisible(ls(name=.GlobalEnv)))
	}

	# Parse dots
	dots <- match.call(expand.dots=FALSE)$...

	if (length(dots) && !all(sapply(dots, function(x) is.symbol(x) ||
																	is.character(x))))
		stop("... must contain names or character strings")

	names <- sapply(dots,as.character)

	# Remove all variables, except marked ones
	rm(list=ls(name=.GlobalEnv)[!ls(name=.GlobalEnv) %in% names], pos=.GlobalEnv)

	# Force garbage collection
	gc()

	# Invisibly return kept values
	invisible(ls(name=.GlobalEnv))
}

#' Deep cleaning of workspace
#'
#' Removes all variables in workspace and forces garbage collection.
#'
#' @details Uses \code{rm()} to remove all variables from \code{ls()} and collects garbage with \code{gc()}
#' @return Output from \code{gc()}
#' @author Malte Thodberg
#' @seealso \code{\link{rm}} \code{\link{ls}} \code{\link{gc}}
#' @export
clear <- function(){
	# Remove all variables in global enviroment
	rm(list=ls(name=.GlobalEnv), pos=.GlobalEnv)

	# Force garbage collection
	gc()
}
