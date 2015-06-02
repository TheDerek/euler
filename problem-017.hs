-- Problem 17
-- Number letter counts

-- If the numbers 1 to 5 are written out in words: one, two, three, four,
-- five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
-- If all the numbers from 1 to 1000 (one thousand) inclusive were
-- written out in words, how many letters would be used?

-- SOLVED

main :: IO()
main = do
  print $ intToWords 400
  
  -- Wrong (21151)
  print $ length $ filterCharacters $ concat $ map intToWords [1..1000]

  -- Correct (23 & 20)
  print $ length $ filterCharacters $ intToWords 342
  print $ length $ filterCharacters $ intToWords 115


filterCharacters :: String -> String
filterCharacters x = filter (/='-') $ filter (/=' ') $ x

-- Convert a Integer into it's words
intToWords :: Int -> String
intToWords 1000 = "one thousand"
intToWords x
  | x < 0 =
      "minus " ++ (intToWords (x * (-1)))
  | x < 20 =
      numberWords !! x
  | x < 100 =
      tens !! (quot x 10) ++ "-" ++ intToWords (rem x 10)
  | x < 1000 && x `rem` 100 == 0 =
      numberWords !! (quot x 100) ++ " hundred"
  | x < 1000 =
      numberWords !! (quot x 100) ++ " hundred and " ++ intToWords (rem x 100)
  where
    numberWords = ["", "one", "two", "three", "four", "five", "six",
                   "seven", "eight", "nine", "ten", "eleven", "twelve",
                   "thirteen", "fourteen", "fifteen", "sixteen",
                   "seventeen", "eighteen", "nineteen"]
    tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty",
            "seventy", "eighty", "ninety"]
