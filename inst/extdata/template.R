#======================
# Basic settings
#======================

# Disable GUI menues
options(menu.graphics=FALSE)

# Always use official cran mirror
options(repos = c(CRAN = "http://cran.rstudio.com"))

# Disable prompt for saving on exit
q <- function (save="no", ...) {
	quit(save=save, ...)
}

# Autocompletion for package names
utils::rc.settings(ipck=TRUE)

# Don't use scientific notation
options(scipen=10)

# Only print 1000 lines, to avoid crashing terminal
options(max.print = 1000)

#======================
# Settings if run from terminal
#======================
.First <- function() {
	if(interactive()){
		if(Sys.getenv("RSTUDIO") == 1){
			require("rstudioapi")
			require("manipulate")
			cat("Starting RStudio-session:", base::date(), "\n")
		}else if(Sys.getenv("TERM") == "xterm-256color"){
			require("colorout")
			require("setwidth")
			cat("Starting Rxterm256-session:", base::date(), "\n")
		}else if(Sys.getenv("TERM") == "xterm"){
			require("colorout")
			require("setwidth")
			cat("Starting Rxterm-session:", base::date(), "\n")
		}else{
			cat("Starting R-session:", base::date(), "\n")
		}
	}
}

.Last <- function() {
	if(interactive()){
		if(Sys.getenv("RSTUDIO") == 1){
			cat("Ending RStudio-session:", base::date(), "\n")
		}else if(Sys.getenv("TERM") == "xterm-256color"){
			cat("Ending Rxterm256-session:", base::date(), "\n")
		}else if(Sys.getenv("TERM") == "xterm"){
			cat("Ending Rxterm-session:", base::date(), "\n")
		}else{
			cat("Ending R-session:", base::date(), "\n")
		}
	}
}



