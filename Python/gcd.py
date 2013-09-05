def gcd(a,b):
    k=0
    t=0
    s=0 
    while (a % 2)==0 and (b % 2==0):
        a=a/2
        b=b/2
        k=k+1
        
    if a%2 ==0:
        t=a
    else:
        t=-b
        t=t*2
    while t!=0:
        #print a,b,t
    	t=t/2
    	if t%2!=0:
    		if t>0:
    		   a=t
    		else:
    		   b=-t
    		#if t!=0:
	    	t=a-b
	    	s=s+1
    	
    r=1
    for i in range(1,k+1):
        r=r*2
    print r,k,s
    return r*a
        
print gcd(5,1024)