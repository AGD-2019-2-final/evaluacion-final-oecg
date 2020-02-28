#! /usr/bin/env python
import sys


if __name__=="__main__":
	
    for linea in sys.stdin:
        letter = linea.split("   ")[0]
		date = linea.split("   ")[1]
		value = int(linea.split("   ")[2])
		value = str(value)
		value = value.zfill(3)
		concatenacion = letter + value
		
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(concatenacion, letter, date, value))