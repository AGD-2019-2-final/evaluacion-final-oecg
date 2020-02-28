#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        word = line.split(' ')[0]
        value = int(line.split(' ')[6])
        
        sys.stdout.write("{}\t{}\t1\n".format(word, value))