#!/usr/bin/python
import sys, os
import argparse

def main(argv):
   username = ''
   repo = ''
   parser = argparse.ArgumentParser()
   parser.add_argument("-f", help="file(s) to add",nargs='+')
   parser.add_argument("-c", help="comments for commit")
   args = parser.parse_args()

   
   qc='"'+args.c+'"'
   d= ' '.join(args.f)
   c='''git add '''+d+'''
        git commit -m '''+qc +" "+d
   print c
   os.system(c)
   
if __name__ == "__main__":
   main(sys.argv[1:])