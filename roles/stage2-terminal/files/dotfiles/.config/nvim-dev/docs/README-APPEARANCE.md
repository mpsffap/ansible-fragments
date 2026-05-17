# Appearance

UI and appearance plugins from [`lua/appearance/`](lua/appearance/).

---

## Colorschemes

### Tokyo Night

**File**: [`appearance/tokyonight.lua`](lua/appearance/tokyonight.lua)  
**Repository**: [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)  
**Description**: Primary colorscheme (set in `options.lua` via VimEnter autocmd)

### Gruvbox

**File**: [`appearance/gruvbox.lua`](lua/appearance/gruvbox.lua)  
**Repository**: [morhetz/gruvbox](https://github.com/morhetz/gruvbox)  
**Description**: Alternative warm colorscheme

---

## Git Integration

### Git Signs

**File**: [`appearance/gitsigns.lua`](lua/appearance/gitsigns.lua)  
**Repository**: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)  
**Description**: Git hunk decorations + navigation

**Signs:** `│` (add/change), `_` (delete), `‾` (topdelete), `~` (changedelete), `┆` (untracked)

| Keys | Action |
|------|--------|
| `]c` | Next hunk |
| `[c` | Prev hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghS` | Stage buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghR` | Reset buffer |
| `<leader>ghp` | Preview hunk |
| `<leader>ghb` | Blame line |
| `<leader>ghd` | Diff this |
| `<leader>ghD` | Diff this ~ |
| `<leader>ghw` | Toggle words |

---

## UI Enhancements

### Colorizer

**File**: [`appearance/colorizer.lua`](lua/appearance/colorizer.lua)  
**Repository**: [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)  
**Description**: Color code highlighting (`#RGB`, `rgb()`)  
**Keybinds**: None (automatic)

### Windows

**File**: [`appearance/windows.lua`](lua/appearance/windows.lua)  
**Repository**: [anuvyklack/windows.nvim](https://github.com/anuvyklack/windows.nvim)  
**Description**: Window management enhancements

### Yank Highlight

**File**: [`appearance/yank-highlight.lua`](lua/appearance/yank-highlight.lua)  
**Repository**: [AckslD/nvim-yank-highlight.lua](https://github.com/AckslD/nvim-yank-highlight.lua)  
**Description**: Highlight yanked text (automatic)

---

## Statusline & Tabline

### Lualine

**File**: [`appearance/lualine.lua`](lua/appearance/lualine.lua)  
**Repository**: [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)  
**Description**: Status line

### Bufferline

**File**: [`appearance/bufferline.lua`](lua/appearance/bufferline.lua)  
**Repository**: [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)  
**Description**: Buffer tabline

### Scrollbar

**File**: [`appearance/scrollbar.lua`](lua/appearance/scrollbar.lua)  
**Repository**: [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)  
**Description**: Scrollbar with hlslens integration

---

## Indentation & Separators

### Indent Blankline

**File**: [`appearance/indent-blankline.lua`](lua/appearance/indent-blankline.lua)  
**Repository**: [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)  
**Description**: Indent guides

### Colorful Winsep

**File**: [`appearance/colorful-winsep.lua`](lua/appearance/colorful-winsep.lua)  
**Repository**: [nvim-colorful-winsep/nvim-colorful-winsep](https://github.com/nvim-colorful-winsep/nvim-colorful-winsep)  
**Description**: Window separator colors

---

## Navigation & UI

### Barbecue

**File**: [`appearance/barbecue.lua`](lua/appearance/barbecue.lua)  
**Repository**: [utilyre/barbecue.nvim](https://github.com/utilyre/barbecue.nvim)  
**Description**: Breadcrumb navigation (automatic)

### Alpha

**File**: [`appearance/alpha.lua`](lua/appearance/alpha.lua)  
**Repository**: [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)  
**Description**: Startup screen

### Symbols Outline

**File**: [`appearance/symbols-outline.lua`](lua/appearance/symbols-outline.lua)  
**Repository**: [simrat39/symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)  
**Description**: Symbol outline view