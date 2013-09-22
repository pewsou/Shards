#!/usr/bin/python

import sys

def KMP_Match(text, pattern):
    pattern.strip("\n")
    tt=len(text)
    tp=len(pattern)
    pf=KMP_PrefixFunction(pattern)
    m=0
    i=0
    print pf
    while m+i<tt:
        if pattern[i]==text[m+i]:
           if i==tp-1:
              print "match found at "+str(m)
              return m
           i=i+1
        else:
           m=m+i-pf[i]
           if pf[i]>-1:
              i=pf[i]
           else:
              i=0
    print ":(=>match not found"       
    pass
        

def KMP_PrefixFunction(pattern):
    m=len(pattern)
    pf=range(0,m+1)
    print pattern
    pf[0]=0
    pf[1]=0
    k=0
    for q in range(2,m):
        print q,k
        while k>0 and pattern[k+1]!=pattern[q]:
             k=pf[k]
        if pattern[k+1]==pattern[q]:
             k=k+1
        pf[q]=k
    return pf
    
def RunTest(inputData):

    for i in range(0, len(inputData),2):
        chunk = inputData[i:i +2]
        print chunk
        if chunk!=None:
           #kmpMatch(chunk[1], chunk[0])
           KMP_Match(chunk[0], chunk[1])
           #print YAKMP(chunk[0], chunk[1])
    pass    
    
if __name__ == '__main__':
    if len(sys.argv) > 1:
        fileLocation = sys.argv[1].strip()
        inputDataFile = open(fileLocation, 'r')
        inputData = inputDataFile.readlines()
        inputDataFile.close()
        print RunTest(inputData)
    else:
        print 'This test requires an input file.  Please select one from the data directory. (i.e. python solver.py ./data/ks_4_0)'

