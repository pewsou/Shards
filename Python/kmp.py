#!/usr/bin/python

#Copyright by Boris Vigman 2013-2014
import sys

def KMP_Match(text, pattern):
    pat=pattern.strip('\n')
    te=list(text.strip('\n'))
    q=0
    i=0
    c=0
    if len(pat)<=2:
       for j in range(0,len(te)):
           if pat[i]==te[j]:
             c=c+1
             if c==len(pat):
                 print ":(=> match found at ",j-i+1
                 return
             i=i+1
           else:
               c=0
               i=0
       print ":(=< match NOT found at all"
       return
    pf=KMP_PrefixFunction(pat)
    te.insert(0,'0')
    tt=len(te)
    tp=len(pat)
    print pf
    l=range(1,tt)

    for i in l:
      while q>0 and pat[q+1]!= te[i]:
        q=pf[q]
      if pat[q+1]==te[i]:
           q=q+1
      if q+1==tp:
         print ":(=> match found at ",i-tp+1
         q=pf[q]
         return
    print "match not found"  
    pass
        

def KMP_PrefixFunction(pattern):
    m=len(pattern)
    pf=range(1,m+1)
    p=list(pattern)
    p.insert(0,'a')
    pf[0]=0
    pf[1]=0
    k=0
    for l in range(0,m):
        pf[l]=0

    for q in range(2,m):
        #print q
        while k>0 and p[k+1]!=p[q]:
             k=pf[k]
        if p[k+1]==p[q]:
             k=k+1
        pf[q]=k

    return pf
    
def RunTest(inputData):

    for i in range(0, len(inputData),2):
        chunk = inputData[i:i +2]
        print chunk
        if chunk!=None:

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

