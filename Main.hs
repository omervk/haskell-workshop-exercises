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

main = putStrLn ex1

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