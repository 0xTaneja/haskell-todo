-- Our Todo App has 3 main targets --
-- 1. adding the data 
-- 2. preview the data , read the data
-- 3. mark that data as done

type Task = String
type Tasks = [Task]


addTasks :: Task -> Tasks -> Tasks
addTasks task tasks = task : tasks  -- prepend task to the list

printTasks :: Tasks -> String
printTasks tasks =
    let 
        printTask index task = show index ++ "-" ++ task 
        reversedList = reverse tasks
        printedTasksList = zipWith printTask [1..] reversedList
    in unlines printedTasksList

removeTask :: Int -> Tasks -> Either String Tasks
removeTask _ tasks = Right tasks  -- TODO: implement remove by index


interactWithUser :: Tasks -> IO Tasks
interactWithUser tasks = do 
    putStrLn "Enter an task to add to your todo list:"
    task <- getLine
    let newTasks = addTasks task tasks
    putStrLn "Task added.\n"
    putStrLn "The List of items is:"
    putStrLn (printTasks newTasks)
    pure newTasks


main :: IO ()
main = do
  putStrLn "TODO app"
  let initialList = []
  _ <- interactWithUser initialList
  putStrLn "Thanks for using our app"