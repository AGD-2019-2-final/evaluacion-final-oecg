#!/usr/bin/env python

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    total = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
        key, val = line.split("\t")
        val = int(val)

        if key == curkey:
            if val > total:
                total = val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, total))
            curkey = key
            total = val

    sys.stdout.write("{}\t{}\n".format(curkey, total))