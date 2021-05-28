#To run the script, ls.py <path(current directory by default>
#To execute ls.py -l, ls <path> -l

import argparse
import os
import sys

parser = argparse.ArgumentParser(prog = 'ls' , usage = '%(prog)s [options] path' , description='ls' , epilog = 'Enjoy !!')
parser.add_argument('Path' , metavar = 'path' , type = str , action = 'store', nargs='?' ,default = os.getcwd() ,help = 'path to ls, current directory by default')
parser.add_argument('-l' , '--long' , action = 'store_true' , help = 'long list')
args = parser.parse_args()
if os.path.isdir(args.Path):
	if args.long:
		for line in os.listdir(args.Path):
			if args.long :
				size = os.stat(os.path.join(args.Path , line)).st_size
				line = '%10d %s' %(size , line)
				print(line)
	else:
		print('\n' .join(os.listdir(args.Path)))
else:
	print('The path does not exist')
