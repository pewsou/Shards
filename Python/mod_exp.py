def mexp1(a,b,n):
    r=1
    for i in b:
        if i==1:
           r=(r*a)%n
        a=(a*a)%n
    return r
def mexp2(a,b,n):
    d=1
    rl=b[::-1]

    for i in rl:
        d=(d*d)%n
        if i==1:
           d=(d*a)%n
    return d
    
b=[0,0,0,1,0,1,1,0]
n=167009093387
a=1899382843
print b
print b[::-1]
print mexp1(a,b,n),mexp2(a,b,n)