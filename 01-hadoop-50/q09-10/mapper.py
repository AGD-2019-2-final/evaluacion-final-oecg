#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        value = int(line.split("   ")[2])
        value = "{:03.0f}".format(value)
        
        sys.stdout.write("{},{}".format(value, line))