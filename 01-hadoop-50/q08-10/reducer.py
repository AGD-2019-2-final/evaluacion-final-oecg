#!/usr/bin/env python

import sys


if __name__ == '__main__':
    
    curkey = None
    total = 0
    count = 0
    
    for line in sys.stdin:
        key, suma, mean = line.split("\t")
        suma = int(suma)
        mean = int(mean)
        
        if key == curkey:
          total += suma
          count += mean

        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, float(total), total/count))

            curkey = key
            total = suma
            count = mean
     
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, float(total), total/count))