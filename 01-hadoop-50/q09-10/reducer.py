#!/usr/bin/env python

import sys


if __name__ == '__main__':
    
    conteo = 0
    
    for line in sys.stdin:
        _, val = line.split(",")
        sys.stdout.write("{}".format(val))
        conteo += 1
        if(conteo == 6):
            break