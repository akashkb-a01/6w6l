#To run the script, type cat.py <file-path>.

import os
import sys
import argparse

parser = argparse.ArgumentParser(prog = 'cat' , description = 'Concatenate files to STDOUT' , epilog = 'Enjoy !!')
parser.add_argument('path' , metavar = 'path' , type = str , help = 'path of file(s)')
args = parser.parse_args()
if os.path.isfile(args.path):
	file = open(args.path, "r")
	print (file.read())
else :
	print('The path to file does not exist')
