{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_HelloHaskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/sid/Code/HelloHaskell/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/bin"
libdir     = "/home/sid/Code/HelloHaskell/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/lib/x86_64-linux-ghc-8.0.2/HelloHaskell-0.1.0.0-76qgaguAzZIJG6rGeWCh4M"
dynlibdir  = "/home/sid/Code/HelloHaskell/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/sid/Code/HelloHaskell/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/share/x86_64-linux-ghc-8.0.2/HelloHaskell-0.1.0.0"
libexecdir = "/home/sid/Code/HelloHaskell/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/libexec"
sysconfdir = "/home/sid/Code/HelloHaskell/.stack-work/install/x86_64-linux/lts-8.23/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HelloHaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HelloHaskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HelloHaskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HelloHaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HelloHaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HelloHaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
