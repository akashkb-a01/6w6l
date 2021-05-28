#This file takes input path(current directory) by default.
#Also to input filename, use -n and to input file size(in bytes), use -s.
#To run the script find.py <path(current directory by default)> -n <filename> -s <filesize>

import os
import sys
import argparse

parser = argparse.ArgumentParser(prog = 'find' , description = 'finds file of given name and size' , epilog = 'Enjoy !!')
parser.add_argument('path', metavar = 'path' , type = str , action = 'store', nargs ='?' ,default = os.getcwd() ,help = 'path to directory, current directory by default')
parser.add_argument('-n','--name' , type = str , help = 'name of the file')
parser.add_argument('-s','--size' , type = int , help = 'size of file')
args = parser.parse_args()
i = args.name
s = args.size
f = os.listdir(args.path)

#Recursive functions ls, lsn and lss

def ls(z):
	k=os.listdir(z)
	num = int(0)
	for num in range(len(k)):
		if(os.path.isfile(os.path.join(z,k[num]))):
			print(os.path.join(z,k[num]))
		if(os.path.isdir(os.path.join(z,k[num]))):
			print(os.path.join(z,k[num]))
			ls(os.path.join(z,k[num]))
	return

def lsn(z):
	k=os.listdir(z)
	num = int(0)
	for num in range(len(k)):
		if(os.path.isfile(os.path.join(z,k[num]))):
			if k[num] == i:
				print(os.path.join(z,k[num]))
		if(os.path.isdir(os.path.join(z,k[num]))):
			if k[num] == i:
				print(os.path.join(z,k[num]))
			lsn(os.path.join(z,k[num]))
	return

def lss(z):
	k=os.listdir(z)
	num = int(0)
	for num in range(len(k)):
		if(os.path.isfile(os.path.join(z,k[num]))):
			if os.stat(os.path.join(z,k[num])).st_size == s:
				if not i:
					print(os.path.join(z,k[num]))
				else :
					if k[num] == i:
						print(os.path.join(z,k[num]))
		if(os.path.isdir(os.path.join(z,k[num]))):
			if os.stat(os.path.join(z,k[num])).st_size == s:
				if not i:
					print(os.path.join(z,k[num]))
				else :
					if k[num] == i:
						print(os.path.join(z,k[num]))
			lss(os.path.join(z,k[num]))
	return

if not (i or s):
	ls(args.path)

if i and not s:
	lsn(args.path)

if s :
	lss(args.path)
