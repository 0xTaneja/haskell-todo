# Haskell Todo CLI

A minimal command-line **Todo list** app written in Haskell. It practices basic Haskell (types, recursion, IO) while adding features incrementally.

## Features

- Add new tasks interactively
- List tasks (oldest first) with 1-based indexing
- Remove a task by its displayed index via `done N`
- Built-in `help` command listing available actions

## Requirements

- [GHC](https://www.haskell.org/ghc/) or [Stack](https://docs.haskellstack.org/en/stable/README/)
- Tested with GHC 9.2+, but any modern version should work

## Running

Clone the repo then run:

```bash
runghc todo.hs
```

Or compile first:

```bash
ghc todo.hs -o todo && ./todo
```

## Commands

```text
items                  # show all tasks (oldest first)
add - <text>           # add a new task
done <index>           # remove the task at the given displayed index (1-based)
help                   # show help
quit                   # exit
```

Example session:

```text
TODO CLI APP
Command's Available: quit, items, help, add - <item to add>, done <item index>
add - buy milk
Item added.
items
The List of Items is:
1-buy milk
done 1
Item marked as done.
items
The List of Items is:
```

Note on indexing: the numbers you see in the list are the indices you pass to `done`. Listing is oldest-first, so `1` refers to the oldest task.

## Roadmap / next steps

- [x] Remove task by displayed number (`done N`)
- [ ] Persist tasks to a file (JSON or plain text) so they survive restarts
- [ ] Optional: keep a "done" flag instead of deleting, and add a `show done` filter
- [ ] Add basic unit tests with `hspec`

Contributions or suggestions are welcome if you’re following along this learning journey! 🍀
