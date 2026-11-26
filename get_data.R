# Downloads the Speed Dating Experiment data (Fisman, Iyengar, Kamenica and
# Simonson, Columbia Business School, 2002-2004) from the copy hosted for
# Gelman and Hill's "Data Analysis Using Regression and Multilevel Models".
# The file is not committed because its license is not stated.

url <- "http://www.stat.columbia.edu/~gelman/arm/examples/speed.dating/Speed%20Dating%20Data.csv"
dest <- file.path("data", "raw", "speed_dating.csv")
expected_sha256 <- "fda9a924b18880fabe6c7a71961cff20aa3c7cc2a5aa8d6e823c2fc41893814c"

dir.create(dirname(dest), recursive = TRUE, showWarnings = FALSE)
if (!file.exists(dest)) {
  download.file(url, dest, mode = "wb")
}

sha256 <- function(path) {
  out <- system2("sha256sum", shQuote(path), stdout = TRUE)
  sub(" .*", "", out)
}
actual <- tryCatch(sha256(dest), error = function(e) NA_character_)
if (is.na(actual)) {
  message("sha256sum not available; skipped the checksum.")
} else if (actual != expected_sha256) {
  stop("Checksum mismatch for ", dest, ": got ", actual)
}
message("Data ready: ", dest)
