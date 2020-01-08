#' @name astral
#' @title astral
#' @description Run the Accurate Species TRee ALgorithm for inferring species
#' trees from gene trees under the multi-species coalescent model.
#' @param input_file File path to list of Newick trees.
#' @param output_file File path to where resulting species tree should be saved.
#' @param log_file File path to where log should be saved. If NULL, no log is
#' saved.
#' @param java_args Extra arguments for Java, character vector.
#' @details
#' 
#' Online documentation for the original program can be found here
#' \url{https://github.com/smirarab/ASTRAL}.
#' 
#' \code{input_file} and \code{output_file} are equivalent to the arguments
#' '-i' and '-o', respectively.
#' 
#' See online for details on input_file formatting.
#' 
#' Change memory settings with \code{-Xmx#M} in \code{java_args}.
#' 
#' @example /examples/astral.R
#' @export
astral <- function(input_file, output_file = 'astral_species.tre',
                   log_file = NULL, java_args = NULL) {
  arglist <- c(java_args, '-jar', '/Astral/astral.jar', '-i',
               basename(input_file), '-o', basename(output_file))
  if (!is.null(log_file)) {
    arglist <- c(arglist, '2>', basename(log_file))
  }
  outdir <- file.path(tempdir(), 'astral_res')
  if(!dir.exists(outdir)) {
    dir.create(outdir)
  }
  on.exit(unlink(x = outdir, recursive = TRUE, force = TRUE))
  otsdr <- outsider_init(pkgnm = 'om..astral', cmd = 'java', arglist = arglist,
                         files_to_send = input_file, wd = outdir)
  res <- run(otsdr)
  file.copy(from = file.path(outdir, basename(output_file)), to = output_file)
  if (!is.null(log_file)) {
    file.copy(from = file.path(outdir, basename(log_file)), to = log_file)
  }
  invisible(res)
}
