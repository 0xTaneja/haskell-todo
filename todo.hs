-- CLI - three subparts
-- Add Item - 
-- Mark it as done 
-- Display Item 
-- IO a - a is of type io where it can perform io actions and in the end it returns something 
-- main entry point of program
-- every compiler - every program search for main 

{-do is a special notation that let us do sequence of io actions getLine - IO String -}

type Item = String
type Items = [Item]

addItem :: Item -> Items -> Items 
addItem item items = item : items

displayItem :: Items -> String 
displayItem items = 
    let 
        printItem index item = show index ++ "-" ++item
        reversedList = reverse items
        printedItemsList = zipWith printItem [1..] reversedList
    in 
        unlines printedItemsList

removeItem :: Int -> Items -> Either String Items 
removeItem reverseIndex allItems =
    impl (length allItems - reverseIndex) allItems
 where 
    impl index items = 
      case (index, items) of 
        (0, item : rest) ->
            Right rest
        (n, []) ->
            Left "Index out of bounds."
        (n, item : rest) ->
            case impl (n - 1) rest of
                Right newItems ->
                   Right (item : newItems)
                Left errMsg ->
                   Left errMsg


data Command = Quit | Help | Done Int | DisplayItems | AddItem String



parseCommand :: String -> Either String Command
parseCommand line = case words line of
  ["quit"] -> Right Quit
  ["items"] -> Right DisplayItems
  "add" : "-" : item -> Right (AddItem (unwords item))
  ["help"] -> Right Help
  ["done",idxStr] ->
    if all (\c -> elem c "0123456789") idxStr
        then Right (Done (read idxStr))
        else Left "Invalid index"
  _ -> Left "Unknown command."

interactWithUser :: Items -> IO ()
interactWithUser items = do
    putStrLn "Command's Available: quit, items, help, add - <item to add>, done <item index>"
    command <- getLine
    case parseCommand command of 
        Right DisplayItems -> do
            putStrLn "The List of Items is: "
            putStrLn (displayItem items)
            interactWithUser items
        Right (AddItem item) -> do 
            let newItems = addItem item items
            putStrLn "Item added. \n"
            interactWithUser newItems
        Right Quit -> do
            putStrLn "Bye!"
            pure ()
        Right Help -> do 
            putStrLn "Command's Available: quit, items, help, add - <item to add>"
            interactWithUser items
        Right (Done index) -> do
            let result = removeItem index items
            case result of 
                Right newItems -> do
                    putStrLn "Item marked as done."
                    interactWithUser newItems
                Left errMsg -> do
                    putStrLn errMsg
                    interactWithUser items
        Left errorMessage -> do 
            putStrLn errorMessage
            interactWithUser items

main :: IO ()
main = do 
    putStrLn "TODO CLI APP"
    let initialList = []
    interactWithUser initialList
    putStrLn "Thanks for using this app."