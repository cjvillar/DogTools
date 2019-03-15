#!/usr/bin/python
import os,sys,gzip,argparse

from argparse import ArgumentParser

def main():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        'infile',
        type=argparse.FileType('rb'),
        default=sys.stdin,
    )

    args = parser.parse_args()


# handles file input
#inFile = sys.argv[1]


#reads number of lines in a gzipped file
with gzip.open(infile, 'rb') as f:
 row = len(f.readlines())   
print("This file has " + '\x1b[6;30;42m' + str(row) + '\x1b[0m'+ " lines")

#Print what this is on screen
print("Here are the first 4 lines of " + '\x1b[6;30;42m' + inFile + '\x1b[0m')

# Prints the first 4 lines in a gzipped file:
with gzip.open(inFile,'r') as f:
	for i in xrange(4):
	  print f.readline()



