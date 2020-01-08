# import
library(outsider)
astral <- module_import('astral', repo = 'dombennett/om..astral')

# data
# test dataset of song mammals
url <- 'https://raw.githubusercontent.com/DomBennett/om..astral/master/test_data/song_mammals.424.gene.tre'
input_file <- file.path(tempdir(), 'song_mammals.424.gene.tre')
download.file(url = url, destfile = input_file)

# run with test file and 1GB memmory
output_file <- file.path(tempdir(), 'song_mammals.tre')
log_file <- file.path(tempdir(), 'log_song_mammals.txt')
astral(input_file = input_file, output_file = output_file, log_file = log_file,
       java_args = '-Xmx1000M')
