import argparse
import os
import sys

parser = argparse.ArgumentParser(prog ='echo' , description = 'prints input taken from the user' , epilog = 'Enjoy !!')
parser.add_argument('input' , help = 'Type something to print it')
args = parser.parse_args()
print(args.input)