#!/usr/bin/env stack
-- stack runghc

--------------------------------

-- HOW TO RUN:

-- stack runghc Main.hs

--------------------------------


-- Declaration of the module name
module Main
-- List of declarations to export
where

-- import other modules
import DB.Utils

-- Module body - declarations


-- Replace `ex1` with the exercise you want to print

main = prompt db

---------------------
-- YOUR WORK BELOW --
---------------------


ex1 = "Hello World!"

-- Exercise 1

type ColumnName = String
type Value = Integer
type Cell = (ColumnName, Value)
type Row = [Cell]
type Table = [Row]

table :: Table
table = [[("col1", 1), ("col2", 2)], [("col1", 3), ("col2", 4)]]

-- Exercise 2

ex2 :: Table
ex2 =
 [
   [ ("x", 1), ("y", 2) ]
 , [ ("x", 3), ("y", 4) ]
 , [ ("x", 5), ("y", 6) ]
 , [ ("x", 7), ("y", 8) ]
 ]

-- Exercise 3

ex3 :: Table -> String
ex3 table =
  let
    consistent = checkTable table
  in
    if consistent
      then
        ppTable table
      else
        "Inconsistent data"

-- Exercise 4

type TableName = String
type Database = [(TableName, Table)]

db :: Database
db =
  [
    ("ex1", table)
  , ("ex2", ex2)
  ]

myMap :: (a -> b) -> [a] -> [b]
myMap f list =
  if null list
    then []
    else (f (head list)) : (myMap f (tail list))

ppTableNames :: Database -> String
ppTableNames db =
  intercalate ", " (myMap getName db)

-- Exercise 5

prompt :: Database -> IO ()
prompt db = do
  putStrLn (ppTableNames db)
  selectedTableName <- getLine
  let foundTable = (lookup selectedTableName db)
      response =
        if isJust foundTable
          then ex3 (fromJust foundTable)
          else "Error, no table with that name found"
  putStrLn response
