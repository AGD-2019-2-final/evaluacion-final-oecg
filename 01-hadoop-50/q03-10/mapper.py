#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        aux = line.split(',')[0]
        valor = int(line.split(',')[1])

        sys.stdout.write("{},{},{}\n".format(valor,aux,valor))