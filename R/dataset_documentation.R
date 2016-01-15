#' Common Packages
#'
#' Names of basic packages that should always be loaded.
#'
#' @format Character vector
#' @author Malte Thodberg
#' @details
#' The list of packages includes:
#'
#' Data manipulation: magrittr, readr, tidyr, dplyr
#'
#' Special data formats: stringr, lubridate
#'
#' Plotting: grid, gridExtra, ggplot2, GGally, ggthemes, ggExtra, ggrepel, RColorBrewer, VennDiagram, pheatmap, wesanderson
#'
#' Performance: matrixStats, parallel
"core_packages"

#' Bioconductor Packages
#'
#' Names of biconductor packages that should always be loaded.
#'
#' @format Character vector
#' @author Malte Thodberg
#' @details
#' The list of packages includes:
#'
#' Installer: BiocInstaller
#'
#' Genomic Arithmetic: Biostrings, IRanges, GenomicRanges, rtracklayer
#'
#' Differential Expression: limma, edgeR, DESeq2
"bioc_packages"

#' Development Packages
#'
#' Names of biconductor packages, which should be loaded when developing.
#'
#' @format Character vector
#' @author Malte Thodberg
#' @details
#' The list of packages includes:
#'
#' Development: Rccp, devtools, roxygen2, pryr, profr
#'
#' RStudio: rstudioapi, manipulate
#'
#' Terminal: setwidth, colorout
"code_packages"
