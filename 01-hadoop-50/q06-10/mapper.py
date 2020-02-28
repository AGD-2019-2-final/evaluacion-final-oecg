#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        letter = line.split(' ')[0]
        count = line.split(' ')[6]
        count = float(count)
        
        sys.stdout.write("{}\t{}\n".format(letter, count))