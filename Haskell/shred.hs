import System.IO as I
import System.Environment
import System.Directory
--import qualified Data.ByteString.Char8 as B
import Data.Maybe
import System.Posix
import Control.Exception
     
main = do
    [f] <- getArgs
    shredFile f

genString::[Integer]->String
genString [] =  "--" 
genString (h:xs) =  "s" ++ genString xs

writeInFile::Handle->String->IO ()
writeInFile h [] = return ()
writeInFile h (hs:ts) = do
    hPutChar h hs 
    writeInFile h ts 
    return ()      

getFileSize path = handle (\(SomeException _) -> return $ Just 0) $
  bracket (openBinaryFile path ReadMode) hClose $ \h -> do
    size <- hFileSize h
    return (Just size)

shredFile::FilePath->IO ()
shredFile f = do
    fs  <- getFileSize f
    print $ fromJust fs
    p <- getPermissions f
    setPermissions f $ p {writable = True} 
    withFile f ReadWriteMode $ add fs
    where
        add fs h = do 
            print $ genString [1..(fromJust fs)] 
            writeInFile h $ genString [1..(fromJust fs)]
            return 0
            hClose h
    --return ()
{-
flushFile path fsize = handle (\(SomeException _) -> return $ Just 0) $
    bracket (openBinaryFile path AppendMode)  hClose $ \h -> do
        print path
        hSeek h RelativeSeek 1
      --  l <- 
        
        print $ genString [1..(fromJust fsize)]  --['a'| x<-[1..9]]
        --fmap (hPutChar h) (return l)
        
        --B.writeFile path $ --B.pack $ genString [1..(fromJust fsize)]
        --print h -- $ genString [1..(fromJust fsize)]
        print $ fromJust fsize
        return (Just 0)
             	
    	
-}