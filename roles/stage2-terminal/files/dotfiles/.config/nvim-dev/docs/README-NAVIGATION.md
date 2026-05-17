# Navigation

Navigation plugins from [`lua/navigation/`](lua/navigation/).

---

## File Explorer

### Neo-tree

**File**: [`navigation/neo-tree.lua`](lua/navigation/neo-tree.lua)  
**Repository**: [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)  
**Description**: File tree with filesystem, buffers, and git_status sources

| Keys | Action |
|------|--------|
| `<leader>e` | Toggle neo-tree at cwd |

---

## Directory Editing

### Oil

**File**: [`navigation/oil.lua`](lua/navigation/oil.lua)  
**Repository**: [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)  
**Description**: Edit directories as buffers

| Keys | Action |
|------|--------|
| `-` | Open current directory |

---

## Terminal File Manager

### Yazi

**File**: [`navigation/yazi.lua`](lua/navigation/yazi.lua)  
**Repository**: [mikavilpas/yazi.nvim](https://github.com/mikavilpas/yazi.nvim)  
**Description**: Terminal file manager integration

| Keys | Action |
|------|--------|
| `<A-y>` | Open yazi |

---

## Fuzzy Finder

### Telescope

**File**: [`core/telescope.lua`](lua/core/telescope.lua)  
**Repository**: [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  
**Description**: File/search picker with fzf-native

| Keys | Action |
|------|--------|
| `<leader>T` | Telescope main menu |
| `<leader>tf` | Find files |
| `<leader>tg` | Grep |
| `<leader>tb` | Buffers |
| `<leader>th` | Help tags |
| `gd` | LSP definitions |
| `gr` | LSP references |

See [`docs/README-CORE.md`](docs/README-CORE.md) for custom telescope pickers.

---

## Quick Navigation

### Harpoon

**File**: [`navigation/harpoon.lua`](lua/navigation/harpoon.lua)  
**Repository**: [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon)  
**Description**: File marks for quick switching

| Keys | Action |
|------|--------|
| `hx` | Open harpoon menu |
| `hm` | Mark file |
| `hn` | Next mark |
| `hp` | Prev mark |
| `h1` - `h5` | Jump to mark 1-5 |

---

## Buffer Picker

### Snipe

**File**: [`navigation/snipe.lua`](lua/navigation/snipe.lua)  
**Repository**: [leath-dub/snipe.nvim](https://github.com/leath-dub/snipe.nvim)  
**Description**: Hint-based buffer switching

| Keys | Action |
|------|--------|
| `<A-s>` | Open buffer list |

---

## Motion Search

### Flash

**File**: [`navigation/flash.lua`](lua/navigation/flash.lua)  
**Repository**: [folke/flash.nvim](https://github.com/folke/flash.nvim)  
**Description**: Enhanced motion search

| Keys | Action |
|------|--------|
| `s` | Search (motion) |