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

#' Setup R
#'
#' Load common packages and remove stringsAsFactors.
#'
#' @author Malte Thodberg
#' @details Silently loads packages from core_packages() and bioc_packages(), deactivates stringsAsFactors and gets bioconductor source URL for package manager
#' @seealso \code{\link{create_Rprofile}} \code{\link{core_packages}} \code{\link{bioc_packages}}
#' @export
setup_R <- function(){
	# Disable stringsAsFactors
	options(stringsAsFactors = FALSE)

	# Update repository manager
	source("http://bioconductor.org/biocLite.R")

	# Silently load packages
	silent_library(core_packages)
	silent_library(bioc_packages)
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

#' Create .Rprofile
#'
#' Copy a template .Rprofile to the home directory
#'
#' @author Malte Thodberg
#' @details coRe/extdata contains a template for an .Rprofile file for an effective R-setup that does not influence code execution. This file will try to adapt startup settings to whether R is run from a terminal or RStudio.
#' @seealso \code{\link{setup_R}}
#' @export
create_Rprofile <- function(){
	# Files
	template_fname <- file.path(find.package("coRe"), "extdata/template.R")
	to_fname <- file.path("~/.Rprofile")

	# Copy file as safely as possibly
	file.copy(from=template_fname, to=to_fname, overwrite=FALSE, recursive=FALSE)
}
