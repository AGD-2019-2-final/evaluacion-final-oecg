#!/usr/bin/env python
import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

    for line in sys.stdin:
        num, key, val = line.split(",")
        val = int(val)

        sys.stdout.write("{},{}\n".format(key, val))