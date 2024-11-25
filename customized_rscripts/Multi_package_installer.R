# Function install and load multiple packages at once
Install_multi_package_bz <- function(packages) {
  # Remove duplicates
  packages <- unique(packages)
  
  # install BiocManager if not installed
  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }
  
  # Filter out already installed packages
  not_installed_yet <- packages[!(packages %in% rownames(installed.packages()))]
  
  if (length(not_installed_yet) > 0) {
    cran_packages <- not_installed_yet[!(not_installed_yet %in% BiocManager::available())]
    bioc_packages <- not_installed_yet[not_installed_yet %in% BiocManager::available()]
    
    # Install CRAN packages
    if (length(cran_packages) > 0) {
      install.packages(cran_packages, dependencies = TRUE)
    }
    
    # Install Bioconductor packages
    if (length(bioc_packages) > 0) {
      BiocManager::install(bioc_packages)
    }
  }
  
  # Load all packages
  invisible(lapply(packages, function(pkg) {
    suppressMessages(require(pkg, character.only = TRUE))
  }))
}

# Define the required packages
packages <- c(
  "reshape2", "ggpubr", "grid", "multcomp", "car", "Rmisc", "nlme", "minqa", "numDeriv", "GGally",
  "nloptr", "RcppEigen", "ggsignif", "readxl", "dendsort", "viridis", "circlize", "BiocManager",
  "zoo", "mvtnorm", "TH.data", "sandwich", "estimability", "plyr", "GlobalOptions", "shape","scales",
  "SparseM", "MatrixModels", "carData", "abind", "pbkrtest", "quantreg", "corrplot", "car", "ggrepel",
  "ggsci", "ggsignif", "gridExtra", "polynom", "rstatix", "tidyverse", "ComplexHeatmap", "emmeans",
  "lme4", "Matrix", "lmerTest", "multcompView", "FSA", "patchwork", "openxlsx", "stringr", "vcfR",
  "magrittr", "VariantAnnotation", "data.table", "naturalsort", "locfit", "rlang", "purrr", "gtools"
)

# Use the function to install and load packages
Install_multi_pkgs(packages)
