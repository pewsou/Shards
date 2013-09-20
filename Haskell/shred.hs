import System.IO as I
import System.Environment
import System.Directory
import Data.Maybe
import System.Posix
import Control.Exception
     
main = do
    [f] <- getArgs
    shredFile f
------------------------------------------------------------------------------------------
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

genString::[Integer]->String
genString [] =  "-" 
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

