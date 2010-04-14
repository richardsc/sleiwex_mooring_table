#!/usr/bin/python
#
# A script to remove the preamble from mooring_table.tex, producing a
# table that can be used in a latex document with \input.

#
# read the data file in as a list
#
fin = open( 'mooring_table.tex', "r" )
#
data_list = fin.readlines()
#
fin.close()

# find \begin{table}
a = data_list[0]
i = 0
while a[0:13] != '\\begin{table}':
    i=i+1
    a = data_list[i]

print i
# remove preamble
del data_list[0:i]

# Replace \begin{table} with \begin{sidewaystable}
data_list[0] = '\\begin{sidewaystable}\scriptsize\n'

# find \end{document}
a = data_list[0]
i = 0
while a[0:14] != '\\end{document}':
    i=i+1
    a = data_list[i]

print i
# remove \end{document}
del data_list[i]

# replace \end{table} with \end{sidewaystable}
data_list[i-1] = '\\end{sidewaystable}'
#
# write the changed data (list) to a file
#
fout = open("mooring_table_intext.tex", "w")
#
fout.writelines(data_list)
#
fout.close()
