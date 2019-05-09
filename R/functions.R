#' @name astral
#' @title astral
#' @description Run astral
#' @param ... Arguments for ASTRAL
#' @param java_args Arguments for java
#' @details Change memory settings with \code{-Xmx#M} in \code{java_args}.
#' @example /examples/astral.R
#' @export
astral <- function(..., java_args = NULL) {
  astral_args <- arglist_get(...)
  files_to_send <- filestosend_get(arglist = astral_args)
  astral_args <- arglist_parse(arglist = astral_args)
  arglist <- c(java_args, '-jar', '/Astral/astral.jar', astral_args)
  otsdr <- outsider_init(pkgnm = 'om..astral', cmd = 'java', arglist = arglist,
                         files_to_send = files_to_send, wd = getwd())
  if ('--help' %in% arglist) {
    # java -jar raises an error for --help
    otsdr$ignore_errors <- TRUE
    res <- run(otsdr)
  } else {
    res <- run(otsdr)
  }
  invisible(res)
}
