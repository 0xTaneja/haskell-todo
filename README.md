# Haskell Todo CLI

A minimal command-line **Todo list** application written in Haskell. The goal is to practice basic Haskell syntax (types, recursion, IO) while gradually adding features.

## Features

* Add new tasks interactively
* View all tasks in reverse-chronological order (most recent first)
* Planned: remove tasks by index, mark tasks as done, and file-based persistence

## Requirements

* [GHC](https://www.haskell.org/ghc/) or [Stack](https://docs.haskellstack.org/en/stable/README/)
* Tested with GHC 9.2+, but any modern version should work

## Running the app

Clone the repo then execute:

```bash
runghc todo.hs
```

or compile first:

```bash
ghc todo.hs -o todo && ./todo
```

Follow the on-screen prompts to add tasks. Output will look similar to:

```text
TODO app
Enter a task to add to your todo list:
>> Buy groceries
Task added.

The list of items is:
1 - Buy groceries
```

## Roadmap / next steps

- [ ] Implement `removeTask` to delete a task by its displayed number
- [ ] Add a `done` flag and command to mark tasks as completed
- [ ] Persist tasks to a JSON or plain-text file so they survive restarts
- [ ] Add basic unit tests with `hspec`

Contributions or suggestions are welcome if you’re following along this learning journey! 🍀
