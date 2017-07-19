module Lib
    ( sayHello
    ) where

helloPerson :: String -> String
helloPerson name = "Hello, " ++ name ++ ", nice to meet you!"

sayHello :: IO ()
sayHello = do
  putStrLn "What is your name?"
  name <- getLine
  let statement = helloPerson name
  putStrLn statement
