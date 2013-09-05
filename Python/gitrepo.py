#!/usr/bin/python
import sys, os
import argparse

def main(argv):
   username = ''
   repo = ''
   parser = argparse.ArgumentParser()
   parser.add_argument("-n", help="github repository name")
   parser.add_argument("-u", help="github user name")
   
   args = parser.parse_args()
   
   c='''touch README.md
     git init
     git add README.md
     git commit -m "first commit"
     git remote add origin https://github.com/'''+args.u+'''/'''+args.n+'''.git
     git push -u origin master
   '''
   os.system(c)
if __name__ == "__main__":
   main(sys.argv[1:])