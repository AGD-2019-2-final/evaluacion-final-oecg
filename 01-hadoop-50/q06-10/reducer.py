#!/usr/bin/env python

import sys


if __name__ == '__main__':

    curkey = None
    total = None
    min_total = None

    
    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)
        
        if total is None:
          total = val

        if min_total is None:
          min_total = val

        if key == curkey:
            total = max(total,val)
            min_total = min(min_total, val)
        
        else:
            
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, min_total))

            curkey = key
            total = val
            min_total = val
     
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, min_total))