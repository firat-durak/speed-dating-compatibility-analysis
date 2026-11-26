pkgs <- c("dplyr", "tidyr", "purrr", "ggplot2", "survival", "sandwich",
          "knitr", "rmarkdown")
missing <- setdiff(pkgs, rownames(installed.packages()))
if (length(missing) > 0) {
  install.packages(missing, repos = "https://cloud.r-project.org",
                   Ncpus = max(1, parallel::detectCores() - 1))
}
