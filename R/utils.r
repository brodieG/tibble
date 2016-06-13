names2 <- function(x) {
  xnames <- names(x)
  if (is.null(xnames)) {
    rep("", length(x))
  } else {
    ifelse(is.na(xnames), "", xnames)
  }
}

"%||%" <- function(x, y) {
  if(is.null(x)) y else x
}

# is.atomic() is TRUE for atomic vectors AND NULL!
is_atomic <- function(x) {
  is.atomic(x) && !is.null(x)
}

is_vector <- function(x) {
  is_atomic(x) || is.list(x)
}

is_1d <- function(x) {
  # dimension check is for matrices and data.frames
  (is_atomic(x) || is.list(x)) && length(dim(x)) <= 1
}

strip_dim <- function(x) {
  if (is_atomic(x))
    dim(x) <- NULL
  x
}

needs_list_col <- function(x) {
  is.list(x) || length(x) != 1L
}

# Work around bug in R 3.3.0
safe_match <- function(x, table) {
  # nocov start
  if (getRversion() == "3.3.0")
    match(x, table, incomparables = character())
  else
    match(x, table)
  # nocov end
}
