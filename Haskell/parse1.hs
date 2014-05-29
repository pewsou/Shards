{-Copyright by Boris Vigman 2013-2014-}

import System.IO
import System.Environment
import Debug.Trace


main = do
    b <- getArgs
    return $ parse (head b) 0
    oneMore
    
-----------------------------------------------

oneMore = do 
	line <- getLine
	a <- return $ traceShow("parse: "++line) $ 
		parse line 0
	traceShow("calling oneMore "++show a) oneMore
	
parse :: [Char] -> Integer -> Integer
parse [] n = traceShow(n) (n)			 
parse all@(d:dt) n  = traceShow (d,dt,n) $ if n<0 then -1
					  else if d=='<' then parse dt (n+1)
					  else if d=='>' then parse dt (n-1)
					  else parse dt n
	