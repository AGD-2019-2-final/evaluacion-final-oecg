#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        credit_history = line.split(',')[2]

        sys.stdout.write("{}\t1\n".format(credit_history))