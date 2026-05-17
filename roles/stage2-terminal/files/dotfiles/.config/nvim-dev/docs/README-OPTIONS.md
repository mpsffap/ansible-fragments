# Neovim Options Reference

Configuration settings from `lua/options.lua`.

---

## Display Settings

| Option | Value | Description |
|--------|-------|-------------|
| `termguicolors` | `true` | Enable true color (24-bit) support |
| `number` | `true` | Show line numbers |
| `relativenumber` | `true` | Show relative line numbers |
| `cursorline` | `true` | Highlight current line |
| `signcolumn` | `'yes'` | Always show sign column |
| `colorcolumn` | `'80'` | Highlight column 80 |
| `showtabline` | `2` | Always show tabline |
| `pumheight` | `10` | Max popup menu items |
| `fillchars` | `{ eob = ' ' }` | Hide end-of-buffer characters |
| `list` | `true` | Show hidden characters |

---

## Editor Behavior

| Option | Value | Description |
|--------|-------|-------------|
| `breakindent` | `true` | Preserve indent on wrapped lines |
| `scrolloff` | `8` | Minimum lines above/below cursor |
| `sidescrolloff` | `8` | Minimum columns left/right of cursor |

---

## Tabs and Indentation

| Option | Value | Description |
|--------|-------|-------------|
| `tabstop` | `4` | Tab width |
| `shiftwidth` | `4` | Indent width |
| `softtabstop` | `4` | Soft tab width |

---

## Splits

| Option | Value | Description |
|--------|-------|-------------|
| `splitright` | `true` | New split goes to the right |
| `splitbelow` | `true` | New split goes below |

---

## Search

| Option | Value | Description |
|--------|-------|-------------|
| `ignorecase` | `true` | Ignore case in searches |
| `smartcase` | `true` | Case-sensitive if uppercase present |
| `inccommand` | `'split'` | Preview substitutions live |

---

## Folding

| Option | Value | Description |
|--------|-------|-------------|
| `foldenable` | `true` | Enable folding |
| `foldlevel` | `99` | Fold level (higher = more open) |
| `foldlevelstart` | `99` | Fold level when opening a file |
| `foldcolumn` | `'1'` | Width of fold column |

---

## File Handling

| Option | Value | Description |
|--------|-------|-------------|
| `swapfile` | `false` | Disable swap files |
| `undofile` | `true` | Enable persistent undo |
| `undodir` | `~/.config/nvim-undodir` | Undo directory |
| `backup` | `false` | Disable backup files |
| `writebackup` | `false` | Disable write backups |
| `autochdir` | `false` | Disable auto-chdir |

---

## Completion

| Option | Value | Description |
|--------|-------|-------------|
| `completeopt` | `'menu,menuone,noselect'` | Popup menu behavior |

---

## Grep

| Option | Value | Description |
|--------|-------|-------------|
| `grepformat` | `'%f:%l:%c:%m'` | Grep output format |
| `grepprg` | `'rg --vimgrep'` | Grep program |

---

## Spell

| Option | Value | Description |
|--------|-------|-------------|
| `spelllang` | `{ 'de', 'en' }` | Spell languages |

---

## Timing

| Option | Value | Description |
|--------|-------|-------------|
| `timeout` | `true` | Enable key timeout |
| `timeoutlen` | `1000` | Key timeout in ms |

---

## System

| Option | Value | Description |
|--------|-------|-------------|
| `clipboard` | `'unnamedplus'` | Use system clipboard |

---

## Disabled Built-ins

The following built-in plugins are disabled (we use alternatives):

| Plugin | Reason |
|--------|--------|
| `netrw` / `netrwPlugin` | Use `neo-tree.nvim` |
| `netrwSettings` / `netrwFileHandlers` | Part of netrw |
| `gzip` | Use native compression |
| `zip` / `zipPlugin` | Use native archive handling |
| `tar` / `tarPlugin` | Use native archive handling |
| `vimball` / `vimballPlugin` | Not needed |
| `2html_plugin` | Not needed |
| `logipat` | Not needed |
| `getscript` / `getscriptPlugin` | Not needed |
| `tutor_mode_plugin` | Not needed |

---

## Disabled Providers

| Provider | Reason |
|----------|--------|
| `node_provider` | Not used |
| `perl_provider` | Not used |
| `ruby_provider` | Not used |