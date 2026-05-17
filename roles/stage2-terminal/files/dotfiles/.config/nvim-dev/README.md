# nvim-dev

A lightweight, fast Neovim configuration built on **Neovim 0.12+**
native APIs. Modular plugin specs grouped by domain, native
`vim.lsp.config` for language servers, blink.cmp for completion,
lazy.nvim for plugin management.

## Core Features

- **Native LSP** — uses `vim.lsp.config` + `vim.lsp.enable` (no
  lspconfig). 21 language servers auto-installed via mason.nvim.
  Snippets via LuaSnip with friendly-snippets.
- **Modular architecture** — plugins grouped by domain (core, appearance,
  navigation, tools, debugging), each with own file, loaded by
  lazy.nvim's `spec` list. No monolithic init.lua.
- **Fast startup** — lazy.nvim with per-plugin `keys`/`cmd`/`ft`
  triggers; autoload-only plugins never run at startup.
- **Fail-safe** — `pcall` wraps operations that could fail (missing
  colorscheme, mkdir, keymap deletions).
- **Self-documenting keybinds** — every `desc` uses `[bracket]`
  notation for which-key integration.

## Load order

```
init.lua
├── options.lua               vim.opt, disabled built-ins, providers
├── keymaps.lua              global keybindings
└── init/
    ├── bootstrap.lua         lazy.nvim bootstrap
    ├── plugins.lua          lazy.nvim setup → requires core/, appearance/, navigation/, tools/, debugging/
    └── lsp.lua              native LSP config (21 servers)
```

(The require chain in `init.lua` is the exact load order.)

---

## Components

### [Options](docs/README-OPTIONS.md)

Toggles all relevant `vim.opt` settings: display (number,
signcolumn, colorcolumn), editor behaviour (scrolloff, breakindent),
tabs (4-wide), splits, search (smartcase, inccommand), folding,
files (undodir, swapfile), completion (menuone,noselect), grep (rg),
spell (de+en), timing, clipboard.

Disabled built-in plugins that are replaced by alternatives (netrw,
gzip, tar, vimball, etc.) and unused providers (node, perl, ruby).

### [Keymaps](docs/README-KEYBINDS.md)

All hand-authored global keybindings grouped by category:
escape/mode, window nav, save/source/quit, search, splits, buffers,
quickfix, line movement, indentation, blackhole registers, shell
commands, sessions, editor tools (snipe, neo-tree), smart delete.

Helper modules (`quickfix`, `smart_delete`) are loaded locally at
the top of the file to avoid repeated `require` calls on every
keystroke.

### Plugins

#### [Core](docs/README-CORE.md)

Powers core editor functionality: auto-completion (blink.cmp),
snippet engine (LuaSnip), syntax highlighting (treesitter), LSP
infrastructure (native vim.lsp.config), language server installation
(mason.nvim), Lua development (lazydev, neoconf), and keybind
documentation (which-key).

#### [Helpers](docs/README-HELPERS.md)

Shared utility modules for `keymaps.lua` and plugin config functions.
Quickfix window toggle, WORD-aware delete, colorscheme protection.

#### [Appearance](docs/README-APPEARANCE.md)

UI layer: colorschemes (tokyonight, gruvbox), statusline (lualine),
buffer tabs (bufferline), scrollbar, git integration (gitsigns),
indent visualization, yank highlighting, window decorations.

#### [Navigation](docs/README-NAVIGATION.md)

File and buffer navigation: neo-tree (file tree), oil (directory
editing), telescope (fuzzy finder), harpoon (file marks), snipe
(buffer picker), yazi (file jumper), flash (motion).

#### [Tools](docs/README-TOOLS.md)

Developer productivity: toggleterm (embedded terminal), overseer
(task runner), rest.nvim (HTTP client), fugitive (git), hlslens
(search lens), todo-comments, autotag, dadbod, sleuth.

#### [Debugging](docs/README-DEBUGGING.md)

Debug Adapter Protocol integration for C, Go, Rust, Python, Node.js.
nvim-dap with language-specific adapters.

---

## Plugin Quick Reference

| Category | Plugin | Config File | Description |
|----------|--------|-------------|-------------|
| **LSP** | vim.lsp.config | [`lua/init/lsp.lua`](lua/init/lsp.lua) | Native LSP (21 servers) |
| **Completion** | blink.cmp | [`lua/core/completion.lua`](lua/core/completion.lua) | Auto-completion engine |
| **Snippets** | LuaSnip | [`lua/core/luasnip.lua`](lua/core/luasnip.lua) | Snippet expansion |
| **Treesitter** | nvim-treesitter | [`lua/core/treesitter.lua`](lua/core/treesitter.lua) | Syntax highlighting |
| **Package Mgr** | mason.nvim | [`lua/core/mason.lua`](lua/core/mason.lua) | LSP/DAP installer |
| **File Explorer** | neo-tree | [`lua/navigation/neo-tree.lua`](lua/navigation/neo-tree.lua) | File tree |
| **Directory Edit** | oil.nvim | [`lua/navigation/oil.lua`](lua/navigation/oil.lua) | Edit directories as buffers |
| **Buffer Picker** | snipe.nvim | [`lua/navigation/snipe.lua`](lua/navigation/snipe.lua) | Quick buffer switching |
| **Fuzzy Finder** | telescope.nvim | [`lua/core/telescope.lua`](lua/core/telescope.lua) | File/search picker |
| **Quick Nav** | harpoon | [`lua/navigation/harpoon.lua`](lua/navigation/harpoon.lua) | File marks |
| **Git** | gitsigns | [`lua/appearance/gitsigns.lua`](lua/appearance/gitsigns.lua) | Git hunk signs |
| **Terminal** | toggleterm.nvim | [`lua/tools/toggleterm.lua`](lua/tools/toggleterm.lua) | Embedded terminal |
| **Debug** | nvim-dap | [`lua/debugging/core.lua`](lua/debugging/core.lua) | Debug adapter protocol |
| **Task Runner** | overseer.nvim | [`lua/tools/overseer.lua`](lua/tools/overseer.lua) | Build/task runner |
| **REST Client** | rest.nvim | [`lua/tools/rest-console.lua`](lua/tools/rest-console.lua) | HTTP testing |
| **Statusline** | lualine | [`lua/appearance/lualine.lua`](lua/appearance/lualine.lua) | Status line |
| **Buffer Tabs** | bufferline | [`lua/appearance/bufferline.lua`](lua/appearance/bufferline.lua) | Buffer tabline |
| **Scrollbar** | nvim-scrollbar | [`lua/appearance/scrollbar.lua`](lua/appearance/scrollbar.lua) | Scrollbar |
| **Colorscheme** | tokyonight | [`lua/appearance/tokyonight.lua`](lua/appearance/tokyonight.lua) | Dark theme |