# Helpers

Utility modules shared across the config at [`lua/helpers/`](lua/helpers/).

---

## quickfix

Toggle the quickfix list window open/closed.

### Details

Scans all open windows for one whose buffer `buftype` is
`'quickfix'`. If found, closes it (`cclose`). If not found,
opens a new quickfix window (`copen`).

Called by `<A-q>` in [`lua/keymaps.lua`](lua/keymaps.lua).

Differs from a naive toggle: checks actual window `buftype`
rather than tracking state in a variable, so it stays correct
even if the quickfix window is closed manually.

---

## smart_delete

Conditional delete-left and delete-right using WORD-aware logic.

### Details

**`left()`** — Smart Backspace:
- At the beginning of a non-first line: join with the previous
  line (`k$J`).
- Character to the left is whitespace: delete single character
  (`hx`).
- Otherwise: delete backward WORD (`dB`).

**`right()`** — Smart Delete:
- Cursor on the last byte of a line: join with the next line
  (`J`).
- Character after cursor is whitespace: delete single character
  (`lx`).
- Otherwise: delete forward WORD (`dW`).

Uses Lua 1-based `string:sub()` which matches `col('.')` natively.

Called by `<S-BS>` and `<S-Del>` in [`lua/keymaps.lua`](lua/keymaps.lua).

---

## themes

Protected colorscheme application with a reusable function.

### Details

`setColorScheme(name)` wraps `vim.cmd('colorscheme ' .. name)` in
`pcall`. If the colorscheme isn't installed, it prints a warning
instead of crashing.

Called by [`lua/appearance/tokyonight.lua`](lua/appearance/tokyonight.lua)'s
`config()` to apply the tokyonight theme. Can be reused for other
colorschemes by importing this module.

---

## telescope-custom

Custom telescope `find_files` pickers rooted at specific
directories. Located at [`lua/core/telescope-custom.lua`](lua/core/telescope-custom.lua)
— loaded as a helper module, not a plugin spec.

### Details

Nine functions, each opening `telescope.builtin.find_files` with
`themes.get_ivy()` and a specific `cwd`:

| Function             | `cwd`          |
|----------------------|----------------|
| `find_files_slight`  | `/`            |
| `find_files_root`    | `/root`        |
| `find_files_home`    | `~`            |
| `find_files_etc`     | `/etc`         |
| `find_files_var`     | `/var`         |
| `find_files_log`     | `/var/log`     |
| `find_files_mps`     | `~/mps`        |
| `find_files_repo`    | `~/mps/repo`   |
| `find_files_scratch` | `~/mps/scratch`|

All use `follow = true` and `hidden = true`.

Called by `<leader>tcs*` keymaps in
[`lua/core/telescope.lua`](lua/core/telescope.lua).