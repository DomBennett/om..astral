#' @name astral
#' @title astral
#' @description Run astral
#' @param astral_args Arguments for ASTRAL
#' @param java_args Arguments for java
#' @details Change memory settings with \code{-Xmx#M} in \code{java_args}.
#' @example /examples/astral.R
#' @export
astral <- function(astral_args, java_args = NULL) {
  files_to_send <- outsider::.filestosend_get(arglist = astral_args)
  arglist <- c(java_args, '-jar', '/Astral/astral.jar', astral_args)
  otsdr <- outsider::.outsider_init(repo = 'dombennett/om..astral',
                                    cmd = 'java', arglist = arglist,
                                    files_to_send = files_to_send, wd = getwd())
  if ('--help' %in% arglist) {
    # java -jar raises an error for --help
    otsdr$ignore_errors <- TRUE
    res <- outsider::.run(otsdr)
  } else {
    res <- outsider::.run(otsdr)
  }
  invisible(res)
}
