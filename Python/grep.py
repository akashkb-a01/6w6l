#grep basically prints only those lines in a file which contains the given input string.
#To run the script, grep.py <input string> <file path>

import os
import sys
import argparse

parser = argparse.ArgumentParser(prog = 'grep' , description = 'find string in file(s)' , epilog = 'Enjoy !!')
parser.add_argument('input' , type = str , help = 'Input the string to find')
parser.add_argument('file' , metavar = 'path' , type = str , help = 'File location to find string')
args = parser.parse_args()
if os.path.isfile(args.file):
	i = args.input
	f = open(args.file , 'r')
	for j in f:
		if i in j:
			print(j)
			j = f.readline()
else :
	print('File path does not exist')
