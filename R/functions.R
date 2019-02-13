#' @name astral
#' @title astral
#' @description Run astral
#' @param ... Arguments
#' @example /examples/astral.R
#' @export
astral <- function(...) {
  arglist <- outsider::.arglist_get(...)
  files_to_send <- outsider::.filestosend_get(arglist = arglist)
  arglist <- c('-jar', '/Astral/astral.jar', arglist)
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
