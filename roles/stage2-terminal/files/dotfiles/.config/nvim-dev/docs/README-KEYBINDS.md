# Keybinds

> Section: **core** — keybindings defined in `lua/keymaps.lua` and
> `lua/core/*.lua` plugin specs.

---

## Mode switching

| Keys       | Action             | File          |
|------------|--------------------|---------------|
| `jk`       | Exit insert mode   | `keymaps.lua` |
| `<C-c>`    | Escape via Ctrl-C  | `keymaps.lua` |

---

## Window navigation

| Keys              | Action       | File          |
|-------------------|--------------|---------------|
| `<C-h>`           | Window left  | `keymaps.lua` |
| `<C-j>`           | Window down  | `keymaps.lua` |
| `<C-k>`           | Window up    | `keymaps.lua` |
| `<C-l>`           | Window right | `keymaps.lua` |

---

## Save / source / quit

| Keys       | Action              | File          |
|------------|---------------------|---------------|
| `<C-s>`    | Save file           | `keymaps.lua` |
| `<A-S>`    | Source current file | `keymaps.lua` |
| `<C-q>`    | Write all and quit  | `keymaps.lua` |

---

## Search

| Keys       | Action                  | File          |
|------------|-------------------------|---------------|
| `<Esc>`    | Clear search highlight  | `keymaps.lua` |
| `g.`       | Search word under cursor| `keymaps.lua` |

---

## UI toggles

| Keys        | Action                  | File          |
|-------------|-------------------------|---------------|
| `<leader>#` | Toggle relativenumber   | `keymaps.lua` |

---

## Split management

| Keys        | Action              | File          |
|-------------|---------------------|---------------|
| `<leader>vs`| Horizontal split    | `keymaps.lua` |
| `<leader>vv`| Vertical split      | `keymaps.lua` |
| `<A-,>`     | Close window        | `keymaps.lua` |
| `<A-.>`     | Close buffer        | `keymaps.lua` |
| `<`         | Resize wider        | `keymaps.lua` |
| `>`         | Resize narrower     | `keymaps.lua` |

---

## Buffer navigation

| Keys       | Action       | File          |
|------------|--------------|---------------|
| `<S-x>`    | Next buffer  | `keymaps.lua` |
| `<S-y>`    | Prev buffer  | `keymaps.lua` |

---

## Quickfix list

| Keys       | Action           | File          |
|------------|------------------|---------------|
| `<A-q>`    | Toggle quickfix  | `keymaps.lua` |
| `<A-n>`    | Next quickfix    | `keymaps.lua` |
| `<A-N>`    | Prev quickfix    | `keymaps.lua` |
| `<A-l>`    | First quickfix   | `keymaps.lua` |
| `<A-L>`    | Last quickfix    | `keymaps.lua` |

---

## Line / selection movement

| Keys       | Action                | File          |
|------------|-----------------------|---------------|
| `<A-j>`    | Move line down        | `keymaps.lua` |
| `<A-k>`    | Move line up          | `keymaps.lua` |
| `<A-j>` i  | Move line down        | `keymaps.lua` |
| `<A-k>` i  | Move line up          | `keymaps.lua` |
| `<A-j>` v/x| Move selection down   | `keymaps.lua` |
| `<A-k>` v/x| Move selection up     | `keymaps.lua` |

---

## Indentation

| Keys | Action                    | File          |
|------|---------------------------|---------------|
| `<`  | Indent left (keep sel)    | `keymaps.lua` |
| `>`  | Indent right (keep sel)   | `keymaps.lua` |

---

## Blackhole registers (d/c → nirvana)

| Keys | Action                     | File          |
|------|----------------------------|---------------|
| `d`  | Delete (blackhole)         | `keymaps.lua` |
| `D`  | Delete line (blackhole)    | `keymaps.lua` |
| `c`  | Change (blackhole)         | `keymaps.lua` |
| `C`  | Change line (blackhole)    | `keymaps.lua` |

(Applies to normal and visual modes.)

---

## Shell commands

| Keys          | Action                | File          |
|---------------|-----------------------|---------------|
| `<leader>bss` | Split bash shell      | `keymaps.lua` |
| `<leader>bs+x`| Make executable       | `keymaps.lua` |
| `<leader>bs-x`| Make non-executable   | `keymaps.lua` |
| `<leader>bsrb`| Run file in bash      | `keymaps.lua` |
| `<leader>bsrp`| Run file in python    | `keymaps.lua` |
| `<leader>bscp`| Copy file             | `keymaps.lua` |
| `<leader>bsmv`| Move file             | `keymaps.lua` |

---

## Sessions

| Keys        | Action              | File          |
|-------------|---------------------|---------------|
| `<leader>ss`| Save session        | `keymaps.lua` |
| `<leader>sr`| Restore session     | `keymaps.lua` |

---

## Plugins

| Keys        | Action              | File                |
|-------------|---------------------|---------------------|
| `<leader>ll`| Open Lazy           | `keymaps.lua`       |
| `<leader>u` | Toggle undotree     | `core/undotree.lua` |
| `-`         | Open Oil directory  | `core/oil.lua`      |
| `<A-e>`     | Neo-tree toggle     | `keymaps.lua`       |
| `<A-E>`     | Neo-tree reveal     | `keymaps.lua`       |
| `<A-s>`     | Snipe buffer menu   | `keymaps.lua`       |
| `<A-y>`     | Open Yazi           | `core/yazi.lua`     |

---

## Telescope pickers

| Keys          | Action                  | File                |
|---------------|-------------------------|---------------------|
| `<leader>T`  | Telescope menu          | `core/telescope.lua`|
| `<leader>tk` | Keymaps                 | `core/telescope.lua`|
| `<leader>th` | Help tags               | `core/telescope.lua`|
| `<leader>tb` | Buffers                 | `core/telescope.lua`|
| `<leader>tr` | Registers               | `core/telescope.lua`|
| `<leader>tj` | Jumplist                | `core/telescope.lua`|
| `<leader>td` | Diagnostics             | `core/telescope.lua`|
| `<leader>tc` | Colorschemes            | `core/telescope.lua`|
| `<leader>tgf`| Git files               | `core/telescope.lua`|
| `<leader>tof`| Old files               | `core/telescope.lua`|
| `<leader>tff`| Find files              | `core/telescope.lua`|
| `<leader>tfz`| Fuzzy buffer            | `core/telescope.lua`|
| `<leader>tgs`| Grep string             | `core/telescope.lua`|
| `<leader>tgl`| Live grep               | `core/telescope.lua`|
| `<leader>/`  | Buffers                 | `core/telescope.lua`|
| `<leader>?`  | Fuzzy buffer            | `core/telescope.lua`|
| `<leader><leader>`| Recent files       | `core/telescope.lua`|

### Custom file searches

| Keys           | Action              | File                |
|----------------|---------------------|---------------------|
| `<leader>tcs/` | Search `/`          | `core/telescope.lua`|
| `<leader>tcso` | Search `/root`      | `core/telescope.lua`|
| `<leader>tcsh` | Search `~`          | `core/telescope.lua`|
| `<leader>tcse` | Search `/etc`       | `core/telescope.lua`|
| `<leader>tcsv` | Search `/var`       | `core/telescope.lua`|
| `<leader>tcsl` | Search `/var/log`   | `core/telescope.lua`|
| `<leader>tcsm` | Search `~/mps`      | `core/telescope.lua`|
| `<leader>tcsr` | Search `~/mps/repo` | `core/telescope.lua`|
| `<leader>tcss` | Search `~/mps/scratch`| `core/telescope.lua`|

### LSP pickers

| Keys | Action               | File                |
|------|----------------------|---------------------|
| `gd` | LSP definitions      | `core/telescope.lua`|
| `gr` | LSP references       | `core/telescope.lua`|
| `glr`| LSP references       | `core/telescope.lua`|
| `gld`| LSP definitions      | `core/telescope.lua`|
| `glt`| LSP type definitions | `core/telescope.lua`|
| `glsd`| LSP document symbols | `core/telescope.lua`|
| `glsw`| LSP workspace symbols| `core/telescope.lua`|
| `glg` | LSP diagnostics      | `core/telescope.lua`|

---

## LSP (buffer-local, set by LspAttach)

| Keys | Action                | File          |
|------|-----------------------|---------------|
| `gD` | Declaration           | `core/lsp.lua`|
| `gh` | Hover                 | `core/lsp.lua`|
| `gk` | Hover (alt)           | `core/lsp.lua`|
| `gsh`| Signature help        | `core/lsp.lua`|
| `gK` | Signature help (alt)  | `core/lsp.lua`|
| `gca`| Code action           | `core/lsp.lua`|
| `gn` | Rename                | `core/lsp.lua`|
| `gtf`| Format                | `core/lsp.lua`|
| `[d` | Prev diagnostic       | `core/lsp.lua`|
| `]d` | Next diagnostic       | `core/lsp.lua`|

---

## Harpoon

| Keys | Action          | File                |
|------|-----------------|---------------------|
| `hx` | Add file        | `core/harpoon.lua`  |
| `hm` | Menu            | `core/harpoon.lua`  |
| `hn` | Next            | `core/harpoon.lua`  |
| `hp` | Prev            | `core/harpoon.lua`  |
| `11` | File 1          | `core/harpoon.lua`  |
| `22` | File 2          | `core/harpoon.lua`  |
| `33` | File 3          | `core/harpoon.lua`  |
| `44` | File 4          | `core/harpoon.lua`  |
| `55` | File 5          | `core/harpoon.lua`  |

---

## LuaSnip (insert / select mode only)

| Keys    | Action         | File                |
|---------|----------------|---------------------|
| `<A-n>` | Expand/jump fwd| `core/luasnip.lua`  |
| `<A-p>` | Jump back      | `core/luasnip.lua`  |

---

## Smart delete

| Keys       | Action               | File          |
|------------|----------------------|---------------|
| `<S-BS>`   | Smart delete left    | `keymaps.lua` |
| `<S-Del>`  | Smart delete right   | `keymaps.lua` |

---

## Git

| Keys           | Action               | File                |
|----------------|---------------------|---------------------|
| `]c`           | Next hunk           | `appearance/gitsigns.lua` |
| `[c`           | Prev hunk           | `appearance/gitsigns.lua` |
| `<leader>ghs`  | Stage hunk          | `appearance/gitsigns.lua` |
| `<leader>ghr`  | Reset hunk          | `appearance/gitsigns.lua` |
| `<leader>ghp`  | Preview hunk        | `appearance/gitsigns.lua` |
| `<leader>gg`   | Open lazygit        | `tools/git.lua`    |
| `<leader>gf`   | Lazygit file        | `tools/git.lua`    |

---

## Debug

| Keys       | Action               | File                |
|------------|---------------------|---------------------|
| `<F9>`     | Start/Continue      | `debugging/core.lua`|
| `<F10>`    | Step over           | `debugging/core.lua`|
| `<F11>`    | Step into           | `debugging/core.lua`|
| `<F12>`    | Terminate           | `debugging/core.lua`|
| `mm`       | Toggle breakpoint  | `debugging/core.lua`|

---

## Todo

| Keys           | Action               | File                |
|----------------|---------------------|---------------------|
| `]t`           | Next todo           | `tools/todo-comments.lua` |
| `[t`           | Prev todo           | `tools/todo-comments.lua` |
| `<leader>ft`   | Search todos       | `tools/todo-comments.lua` |

---

## Window

| Keys       | Action               | File          |
|------------|---------------------|---------------|
| `<C-w>z`   | Maximize            | `keymaps.lua` |
| `<C-w>_`   | Equalize            | `keymaps.lua` |
