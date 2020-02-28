#! /usr/bin/env python
import sys
if __name__ == "__main__":

    for line in sys.stdin:
        value = int(line.split("	")[0])
        value = "{:03.0f}".format(value)
        letters = (line.split("	")[1].rstrip("\r\n")).split(",")
        for letter in letters:
            sys.stdout.write("{}\t{}\n".format(letter, value))