#!/usr/bin/python
# -*- coding: utf-8 -*-
import array
import zlib

takenl = []


WEIGHTS=1
VALUES=0
precalccache=dict()

import itertools
    
def optimize3(spairs,items,maxcap):
    m=[]
    cm=[]

    for i in xrange(0,1):
        m.append(array.array('L'))
        for j in xrange(0,maxcap+1):
            m[i].append(0)
    press= zlib.compress
    unpress=zlib.decompress
    appendToRoot=m.append
    appendPress=cm.append       

    for i in xrange(1,items+1):
        appendToRoot(array.array('L'))
        appendLeaf=m[i].append
        for j in xrange(0,maxcap+1):
            appendLeaf(0)
        for j in xrange(0,maxcap+1):
            #print m
            if j>=spairs[i-1][WEIGHTS]:
                m[i][j] = max(m[i-1][ j], m[i-1][ j-spairs[i-1][WEIGHTS]] + spairs[i-1][VALUES])
            else:
                m[i][j] = m[i-1][j]
        if i>1:
            appendPress(press(m[i-2].tostring()))
            del m[i-2][0:len(m[i-2])]
        print i
    appendPress(press(m[items-1].tostring()))
    del m[items-1][0:len(m[items-1])]
    appendPress(press(m[items].tostring()))
    del m[items][0:len(m[items])]

    r=[]
    rw=maxcap
    fin=0
    for t in xrange(items, 0, -1):
        obj0=unpress(cm[t])
        m[t]=array.array('L')
        m[t].fromstring(obj0)
        obj1=unpress(cm[t-1])
        m[t-1]=array.array('L')
        m[t-1].fromstring(obj1)
        if t==items:
            fin = m[t][rw]

        added = m[t][maxcap] != m[t-1][maxcap]
    
        if added:
            r.append(spairs[t-1])
            maxcap -= spairs[t-1][WEIGHTS]
        del m[t][0:len(m[t])]
        del m[t-1][0:len(m[t-1])]
    return (r,fin)
    

def solveIt(inputData):
    global sortpairs,pairs,takenl
    taken=[]
    pairs=[]
    lines = inputData.split('\n')

    firstLine = lines[0].split()
    items = int(firstLine[0])
    capacity = int(firstLine[1])

    values = []
    weights = []
    c=0
    for i in xrange(1, items+1):
        line = lines[i]
        parts = line.split()
        v=int(parts[0])
        w=int(parts[1])
        values.append(int(parts[VALUES]))
        weights.append(int(parts[WEIGHTS]))
        pairs.append((int(parts[VALUES]),int(parts[WEIGHTS]),i-1))
        taken.append(0)
    distinctItems = len(pairs)
    

    value = 0
    weight = 0
    r=optimize3(pairs,distinctItems,capacity)

    for it in r[0]:
        taken[it[2]]=1
    # prepare the solution in the specified output format
    outputData = str(r[1]) + ' ' + str(1) + '\n'
    outputData += ' '.join(map(str, taken))
    r=None
    sortpairs=[]
    pairs=[]
    takenl=[]
    return outputData


import sys

if __name__ == '__main__':
    if len(sys.argv) > 1:
        fileLocation = sys.argv[1].strip()
        inputDataFile = open(fileLocation, 'r')
        inputData = ''.join(inputDataFile.readlines())
        inputDataFile.close()
        print solveIt(inputData)
    else:
        print 'This test requires an input file.  Please select one from the data directory. (i.e. python solver.py ./data/ks_4_0)'

