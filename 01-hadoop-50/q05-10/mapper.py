#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        date = line.split('-')[1]
        
        sys.stdout.write("{}\t1\n".format(date))