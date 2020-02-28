#!/usr/bin/env python

import sys


if __name__ == '__main__':
    
    curkey = None
    numbers = ""
    
    for line in sys.stdin:
        key, val = line.split("\t")
        val = str(int(val))

        if key == curkey:
            numbers = numbers + "," + val
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, numbers))
            curkey = key
            numbers = val
        
    sys.stdout.write("{}\t{}\n".format(curkey, numbers))