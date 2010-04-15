#!/usr/bin/env python
import sys
import re

def main(indent='  '):
    '''
    Reformat tables within a latex document, using a line for each row
    and column.  The result is printed, which is probably 
    not as good as returning a character string.  Actually, main()
    should really slurp in a whole file, and pass the string containing
    the file to a function that returns an altered string.
    '''
    begin = re.compile(r"^.*\\begin\{.*table\}.*$")
    end = re.compile(r"^.*\\end\{.*table\}.*$")
    if len(sys.argv) != 2:
        print "must supply one, and only one, file name"
        return 1
    try:
        f = open(sys.argv[1], 'r')
    except IOError:
        print 'cannot open', sys.argv[1]
    else:
        lines = f.readlines()
        nlines = len(lines)
        iline = 0
        while iline < nlines:
            print lines[iline].strip()
            if begin.match(lines[iline]):
                iline = iline + 1
                while iline < nlines:
                    if end.match(lines[iline]):
                        print lines[iline].strip()
                        break
                    else:
                        parts = lines[iline].strip().split('&')
                        nparts = len(parts)
                        if nparts == 1:
                            print lines[iline].strip()
                        else:
                            print indent, parts[0]
                            for ipart in range(1, nparts):
                                print indent, '&', parts[ipart]
                        iline = iline + 1
            iline = iline + 1
        f.close()

if __name__ == "__main__":
    main()

