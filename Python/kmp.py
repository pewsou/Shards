#!/usr/bin/python

import sys




def failTable(pattern):
    # Create the resulting table, which for length zero is None.
    result = [None]

    # Iterate across the rest of the characters, filling in the values for the
    # rest of the table.
    for i in range(0, len(pattern)):
        # Keep track of the size of the subproblem we're dealing with, which
        # starts off using the first i characters of the string.
        j = i

        while True:
            # If j hits zero, the recursion says that the resulting value is
            # zero since we're looking for the LPB of a single-character
            # string.
            if j == 0:
                result.append(0)
                break

            # Otherwise, if the character one step after the LPB matches the
            # next character in the sequence, then we can extend the LPB by one
            # character to get an LPB for the whole sequence.
            if pattern[result[j]] == pattern[i]:
                result.append(result[j] + 1)
                break

            # Finally, if neither of these hold, then we need to reduce the
            # subproblem to the LPB of the LPB.
            j = result[j]
    
    return result

def kmpMatch(needle, haystack):
    # Compute the failure table for the needle we're looking up.
    fail = failTable(needle)

    # Keep track of the start index and next match position, both of which
    # start at zero since our candidate match is at the beginning and is trying
    # to match the first character.
    index = 0
    match = 0
    print fail
    # Loop until we fall off the string or match.
    while index + match < len(haystack):
        #print index, match

        # If the current character matches the expected character, then bump up
        # the match index.
        if haystack[index + match] == needle[match]:
            match = match + 1

            # If we completely matched everything, we're done.
            if match == len(needle):
                print "match at "+str(index)
                return index

        # Otherwise, we need to look at the fail table to determine what to do
        # next.
        else:
            # If we couldn't match the first character, then just advance the
            # start index.  We need to try again.
            if match == 0:
                index = index + 1

            # Otherwise, see how much we need to skip forward before we have
            # another feasible match.
            else:
                index = index + match - fail[match]
                match = fail[match]

    # If we made it here, then no match was found.
    return None
def RunTest(inputData):

    for i in range(0, len(inputData),2):
        chunk = inputData[i:i +2]
        print chunk
        if chunk!=None:
           #kmpMatch(chunk[1], chunk[0])
           KMP_Match(chunk[0], chunk[1])
           #print YAKMP(chunk[0], chunk[1])
    pass
    
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
    pf=range(0,m)
    pf[0]=-1
    pf[1]=0
    k=0
    q=2
    while q<m:
       #(first case: the substring continues)
        if pattern[q-1] == pattern[k]:
            k = k + 1
            pf[q] = k
            q = q + 1
        #(second case: it doesn't, but we can fall back)
        elif k > 0 :
             k=pf[k]
        #(third case: we have run out of candidates.  Note k = 0)
        else:
            pf[q] = 0
            q = q + 1
    return pf
        

def KMP_PrefixFunction__(pattern):
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
    
if __name__ == '__main__':
    if len(sys.argv) > 1:
        fileLocation = sys.argv[1].strip()
        inputDataFile = open(fileLocation, 'r')
        inputData = inputDataFile.readlines()
        inputDataFile.close()
        print RunTest(inputData)
    else:
        print 'This test requires an input file.  Please select one from the data directory. (i.e. python solver.py ./data/ks_4_0)'

