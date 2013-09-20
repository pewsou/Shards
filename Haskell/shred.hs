import System.IO as I
import System.Environment
import System.Directory
import Data.Maybe
import System.Posix
import Control.Exception
     
main = do
    b <- getArgs
    root <- return $ head b
    c <- return $ tail b
    processBatch [] b
------------------------------------------------------------------------------------------
processBatch::FilePath->[FilePath]->IO ()
processBatch root (xs:ts) = do
         isDir <- doesDirectoryExist (root++xs)
         print isDir
         if isDir 
         then  do
            files <- getDirectoryContents (root++xs)
            let properNames = filter (`notElem` [".", ".."]) files
            processBatch (root++xs++"/") properNames  
            processBatch root ts 
         else do
             shredFile $ root++xs
             processBatch root ts
processBatch _ [] = return ()

shredFile::FilePath->IO ()
shredFile f = do
    fs  <- getFileSize f
    p <- getPermissions f
    setPermissions f $ p {writable = True} 
    withFile f ReadWriteMode $ add fs
    where
        add fs h = do 
            writeInFile h $ genString [1..(fromJust fs)]
            return 0
            hClose h


genString::[Integer]->String
genString [] =  "-" 
genString (h:xs) =  "+" ++ genString xs

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

