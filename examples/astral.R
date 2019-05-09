library(outsider)
astral <- module_import('astral', repo = 'dombennett/om..astral')
astral('--help')
# # Elaborate exmaple (NOT RUN)
# # download example file
# download.file(url = 'https://raw.githubusercontent.com/DomBennett/om..astral/master/test_data/song_mammals.424.gene.tre')
# # run with test file and 1GB memmory
# astral('-i', 'song_mammals.424.gene.tre', '-o', 'song_mammals.tre', java_args = '-Xmx1000M')
