# Common packages
core_packages <- c("magrittr", "readr", "tidyr", "dplyr", "tibble", "purrr", # Data manipulation
	"stringr", "lubridate", # Special data formats
	"grid", "gridExtra", "ggplot2", "GGally", "ggthemes", "ggExtra", "ggrepel", "RColorBrewer", "VennDiagram", "pheatmap",	"wesanderson", "viridis",# Plotting
	"matrixStats", "parallel")

devtools::use_data(core_packages, overwrite=TRUE)

# Code packages
bioc_packages <- c("BiocInstaller", # Package manager
		"Biostrings", "IRanges", "GenomicRanges", "SummarizedExperiment", "rtracklayer", # Genomic Arithmetic,
		"limma", "edgeR", "DESeq2") # DE analysis

devtools::use_data(bioc_packages, overwrite=TRUE)

# Developments packages
code_packages <- c("Rcpp", "devtools", "roxygen2", "pryr", "profr", "assertthat", # Development
		"rstudioapi", "manipulate", # RStudio
		"setwidth", "colorout") # Terminal

devtools::use_data(code_packages, overwrite=TRUE)
