# Neovim Configuration Agent Guidance

**This file contains ALL mandatory rules, design specifications, and implementation guidelines for AI agents working on the `nvim-dev` configuration. Agents MUST read and follow these guidelines without exception.**

---

## Overview

`nvim-dev` is a lightweight, fast Neovim 0.12+ configuration built on native APIs with a focus on modularity and performance. The configuration uses:

- **Plugin manager:** lazy.nvim
- **LSP API:** native `vim.lsp.config` + `vim.lsp.enable` (no lspconfig)
- **Completion:** blink.cmp with LuaSnip backend
- **21 LSP servers** via mason.nvim

---

## 1. Mandatory Agent Rules (Axioms)

### 1.1 Response Language
- **Always respond in English**
- Never switch languages unless explicitly asked

### 1.2 Lightweight & Fast Principle
- Every change must keep the configuration lightweight and fast
- **Prefer Neovim built-ins over plugins** when possible
- **Avoid redundant options** that match Neovim or plugin defaults

### 1.3 Axiom Violation Warnings
- If any proposed change violates an axiom, the agent **MUST warn the user before proceeding**

### 1.4 Helpers Pattern
- Self-written utility modules belong in `lua/helpers/`
- Each helper module should be a focused function module

### 1.5 Fail-Safe Practices
- Wrap operations that can fail in `pcall`:
  - `vim.fn.mkdir`
  - `vim.api.nvim_del_keymap`
  - `vim.cmd('colorscheme ...')`
  - `require('telescope').load_extension`

### 1.6 Non-Blocking Startup
- Use `vim.schedule` for deferred startup tasks
- **Never block `init.lua` with synchronous installs**

### 1.7 Cache Requires Pattern
- When a helper module is called from keymaps, require it **once locally at the top of the file**
- **Never `require()` the same module on every keystroke**

### 1.8 Plugin Specs Structure
- **Organized by functionality** across multiple directories:
  - `lua/core/` - Core functionality plugins (completion, LSP, treesitter, etc.)
  - `lua/appearance/` - UI and appearance plugins
  - `lua/navigation/` - Navigation plugins
  - `lua/tools/` - Development tools
  - `lua/debugging/` - Debugging and DAP plugins
- **One file per plugin** in the appropriate directory
- Use aggregator `init.lua` files in each directory (loaded via `require("directory")`)

### 1.9 Strip Defaults When Porting
- When porting plugin config, **compare every option against the plugin's current defaults**
- **Remove anything that matches** — only keep non-default customizations

### 1.10 Keybind `desc` Convention
- All `desc` values use `[CATEGORY] comment` format
- Example: `'[Telescope] telescope keymaps'`, `'[LSP] go to definition'`

### 1.11 Native LSP Usage
- **Use `vim.lsp.config` + `vim.lsp.enable`** exclusively for server configuration
- **Never use `lspconfig.setup` or `lspconfig.util`** for server setup

---

## 2. Project Structure

```
~/.config/nvim-dev/
├── init.lua                  # Entry point (8 lines)
├── README.md                 # Project overview
├── docs/                     # Documentation
│   ├── README-CORE.md
│   ├── README-HELPERS.md
│   ├── README-KEYBINDS.md
│   ├── README-OPTIONS.md
│   ├── README-APPEARANCE.md
│   ├── README-NAVIGATION.md
│   ├── README-TOOLS.md
│   └── README-DEBUGGING.md
├── .ai/
│   └── AGENTS.md             # This file
└── lua/
    ├── init/                 # Bootstrap & core setup
    │   ├── bootstrap.lua     # lazy.nvim bootstrap
    │   ├── plugins.lua       # Spec aggregator (requires core, appearance, etc.)
    │   └── lsp.lua           # 21 LSP servers
    ├── core/                 # Core plugin specs
    │   ├── init.lua          # Aggregator (requires all core/*.lua except lsp)
    │   ├── completion.lua
    │   ├── luasnip.lua
    │   ├── friendly-snippets.lua
    │   ├── treesitter.lua
    │   ├── mason.lua
    │   ├── lazydev.lua
    │   ├── neoconf.lua
    │   ├── which-key.lua
    │   ├── telescope.lua
    │   ├── telescope-custom.lua  # Helper, not plugin spec
    │   └── ...
    ├── appearance/           # UI/Appearance plugins
    │   ├── init.lua
    │   ├── tokyonight.lua
    │   ├── gruvbox.lua
    │   ├── gitsigns.lua
    │   ├── lualine.lua
    │   ├── bufferline.lua
    │   └── ...
    ├── navigation/          # Navigation plugins
    │   ├── init.lua
    │   ├── neo-tree.lua
    │   ├── oil.lua
    │   ├── harpoon.lua
    │   ├── snipe.lua
    │   ├── yazi.lua
    │   └── flash.lua
    ├── tools/               # Development tools
    │   ├── init.lua
    │   ├── toggleterm.lua
    │   ├── overseer.lua
    │   ├── rest-console.lua
    │   ├── git.lua
    │   └── ...
    ├── debugging/           # Debugging tools
    │   ├── init.lua
    │   └── core.lua
    ├── helpers/             # Utility modules
    │   ├── quickfix.lua
    │   ├── smart_delete.lua
    │   └── themes.lua
    ├── options.lua          # vim.opt, disabled built-ins
    └── keymaps.lua          # Global keybindings
```

### Load Order
```
init.lua
├── options.lua              # vim.opt, disabled built-ins, providers
├── keymaps.lua              # global keybindings
└── init/
    ├── bootstrap.lua        # lazy.nvim bootstrap
    ├── plugins.lua         # lazy.nvim setup → requires core/, appearance/, navigation/, tools/, debugging/
    └── lsp.lua             # native LSP config (21 servers)
```

---

## 3. LSP Configuration

### Native LSP Approach
- **No `lspconfig`** — servers defined via `vim.lsp.config` directly
- Server configuration uses native APIs:
```lua
vim.lsp.config.ruff = {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
}
vim.lsp.enable('ruff')
```

### 21 LSP Servers
Python, Web (ts_ls, html, cssls, jsonls), Shell (bashls), Docker, Rust, C/C++, Go, Lua, Markdown, TOML, and more.

### LSP Keymaps (via LspAttach)
- `gD` → Declaration
- `gh` / `gk` → Hover
- `gsh` / `gK` → Signature help
- `gca` → Code action
- `gn` → Rename
- `gtf` → Format
- `[d` / `]d` → Diagnostic prev/next

### Telescope LSP Pickers
- `gd` → Telescope LSP definitions
- `gr` → Telescope LSP references

---

## 4. Keybinding Conventions

### Global Keymaps (`keymaps.lua`)
- Grouped by category
- Helper modules loaded locally at the top
- Use `vim.keymap.set` with descriptive `desc` values

### `desc` Format
- **Category prefix format**: `[CATEGORY] comment text`
- **Space after bracket**: Always one space between `]` and comment

---

## 5. Helper Modules (`lua/helpers/`)

### quickfix.lua
- **Purpose**: Toggle the quickfix list window
- **Use**: Called by `<A-q>` in `keymaps.lua`

### smart_delete.lua
- **Purpose**: Conditional delete-left and delete-right using WORD-aware logic
- **Use**: `<S-BS>` and `<S-Del>` in `keymaps.lua`

### themes.lua
- **Purpose**: Protected colorscheme application with `pcall`
- **Use**: Safely apply colorschemes

---

## 6. Adding New LSP Server

```lua
-- In lua/init/lsp.lua

-- 1. Add to Mason ensure_installed
vim.schedule(function()
  local registry = require("mason-registry")
  local ok, err = pcall(function()
    registry.ensure_installed({
      -- add new server here
    })
  end)
end)

-- 2. Add server configuration
vim.lsp.config.new_server = {
  cmd = { 'server-command', '--stdio' },
  filetypes = { 'filetype' },
  root_markers = { 'file', '.git' },
}
vim.lsp.enable('new_server')
```

---

## 7. Adding a New Plugin

1. **Create spec file** in appropriate directory (e.g., `lua/core/my_plugin.lua`)
2. **Add require** to the directory's `init.lua` aggregator
3. **Configure** with minimal options, stripping defaults
4. **Add keybindings** with proper `desc` format

---

## 8. Common Tasks

### Adding a New Helper Module
```lua
-- In lua/helpers/new_helper.lua
local M = {}

function M.some_function()
  local ok, result = pcall(some_operation)
  if not ok then
    vim.notify("Helper failed: " .. result, vim.log.levels.WARN)
    return nil
  end
  return result
end

return M
```

---

## 9. Verification Requirements

After any significant change:
1. **Test startup** — `nvim --headless -c "q"`
2. **Verify LSP servers** connect and function
3. **Check keybindings** work as expected
4. **Ensure no Lua errors** on startup
5. **Commit** with descriptive message

---

## 10. Violation Handling

When encountering a violation:
1. **Identify** the specific axiom being violated
2. **Explain** why it's a violation
3. **Suggest** the correct approach
4. **Ask for confirmation** before proceeding

---

**Last Updated**: 2026-05-17  
**Purpose**: Single source of truth for AI agents working on `nvim-dev` configuration

---

*Agents MUST reference this file before making any changes to the configuration.*  
*All rules in this document are MANDATORY and NON-NEGOTIABLE.*