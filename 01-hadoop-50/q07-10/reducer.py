#! /usr/bin/env python
import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:

		letter = linea.split()[0]
		date = linea.split()[1]
		value = linea.split()[2]
		value = str(value)
		value = value.zfill(3)
		concat = letter + value
		
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(concat, letter, date, value))