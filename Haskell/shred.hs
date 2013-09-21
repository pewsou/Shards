import System.IO as I
import System.Environment
import System.Directory
import Data.Maybe
import System.Posix
import System.Random
import Control.Exception
--import Data.ByteString.Char8 as B     

{- This is shredding utility
   it takes list of files, replaces the contents with some pattern 
   and renames to then random name
   For directories - it scans all directories, rewrites contained files 
   and renames directories too
-}
main = do
    b <- getArgs
    root <- return $ head b
    c <- return $ tail b
    processBatch [] b
------------------------------------------------------------------------------------------
rngr = 1000000
writeBlockSize=1000000
pattern=genString '-' [1..writeBlockSize]

processBatch::FilePath->[FilePath]->IO ()
processBatch root (xs:ts) = do
         isDir <- doesDirectoryExist (root++xs)
         let dn=(root++xs)
         if isDir 
         then  do
            gen <- newStdGen
            files <- getDirectoryContents (root++xs)
            let properNames = filter (`notElem` [".", ".."]) files
            processBatch (dn++"/") properNames  
            let str = take 10 $ randomRs ('a','z') gen 
            processBatch root ts 
            renameDirectory dn $ root++"/"++str
         else do
             shredFile root dn
             processBatch root ts
processBatch _ [] = return ()

shredFile::String->FilePath->IO ()
shredFile root f = do
    fs  <- getFileSize f
    p <- getPermissions f
    setPermissions f $ p {writable = True} 
    withBinaryFile f ReadWriteMode $ add fs
    where
        add fs h = do 
            fillFile f h ')' (fromJust fs)
            return 0
            gen <- newStdGen
            let str = take 10 $ randomRs ('a','z') gen 
            hClose h
            renameFile (f) (root++"/"++str)

genString::Char->[Integer]->String
genString _ [] =  "-" 
genString c (h:xs) =  [c] ++ genString c xs

fillFile::FilePath->Handle->Char->Integer->IO ()
fillFile f hnd c num 
              |num<=0 = return ()
              |otherwise = do
                        hPutStr hnd $ pattern
                        fillFile f hnd c $ num-writeBlockSize
                        return ()
{-
writeInFile::Handle->String->IO ()
writeInFile h [] = return ()
writeInFile h (hs:ts) = do
    hPutChar h hs 
    writeInFile h ts 
    return ()      
-}
getFileSize path = handle (\(SomeException _) -> return $ Just 0) $
  bracket (openBinaryFile path ReadMode) hClose $ \h -> do
    size <- hFileSize h
    return (Just size)

