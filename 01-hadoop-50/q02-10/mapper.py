#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        aux = line.split(',')
        purpose = aux[3]
        valor = aux[4]

        sys.stdout.write("{}\t{}\n".format(purpose, valor))