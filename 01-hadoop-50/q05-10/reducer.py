#!/usr/bin/env python

import sys

if __name__ == '__main__':

    curkey = None
    total = None
    
    for line in sys.stdin:
        key, val = line.split("\t")
        val = int(val)
        
        if total is None:
          total = val

        if key == curkey:
            total += val

        else:
            if curkey is not None:
                sys.stdout.write("{} {}\n".format(curkey, total))

            curkey = key
            total = val
     
    sys.stdout.write("{} {}\n".format(curkey, total))