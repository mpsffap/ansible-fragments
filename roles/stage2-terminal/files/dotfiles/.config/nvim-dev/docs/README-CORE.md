# Core Plugins

Plugin specs and native configuration for core editor functionality
at `lua/core/`. Loaded via `require("core")` in `lua/init/plugins.lua`.

---

## completion

[Blink.cmp](https://github.com/Saghen/blink.cmp) completion engine with
LuaSnip as the snippet backend.

**Keymaps:** `<Tab>` select next / snippet forward / fallback;
`<S-Tab>` previous / fallback; `<C-y>` accept; `<C-space>` /
`<C-@>` show/hide.

**Sources:** `lsp`, `path`, `snippets`, `buffer` (in that order).

**Snippet backend:** LuaSnip.

---

## friendly-snippets

[ friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
— collection of pre-made snippets for many languages.

---

## fidget

[folke/fidget.nvim](https://github.com/folke/fidget.nvim) — LSP
progress notifications.

Minimal setup: default `opts = {}`. Shows LSP server progress
in a floating window or notification.

---

## lazydev

[folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) for
Neovim API completion in Lua files.

Loaded only for `ft = 'lua'`. Uses default `opts = {}`. Replaces
the old approach of manually adding `vim`-api paths to the Lua LSP
workspace library.

---

## luasnip

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) snippet engine with
custom snippets.

**Keys:** `<A-n>` expand/jump forward, `<A-p>` jump backward
(both in insert and select modes only).

**Custom Snippets:**
- **Python** — `print("<>")` wrapping insert node
- **REST** — Full request template with host, headers, body

---

## mason

[williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
— LSP/DAP/linter installer.

Minimal setup: default `opts`. No mason-lspconfig integration —
server configs are set up via native `vim.lsp.config` in
[`lua/init/lsp.lua`](lua/init/lsp.lua).

**Ensure Installed:** 21 LSP servers including ruff, pyright,
lua-language-server, ts_ls, rust-analyzer, clangd, and more.

---

## neoconf

[folke/neoconf.nvim](https://github.com/folke/neoconf.nvim) —
JSON-based project-local configuration.

Uses default `opts = {}`. Reads `.neoconf.json` and
`.nvim/config.lua` files from project roots.

---

## treesitter

[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
— syntax highlighting and parsing.

**Parsers:** `ensure_installed = { 'python', 'lua', 'jsonc' }` plus
`auto_install = true` (installs parsers for any new filetype
on the fly). Highlight enabled; no other modules (folding,
indent) are turned on.

---

## telescope

[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
— fuzzy finder.

**Dependencies:** plenary.nvim, telescope-fzf-native.nvim
(builds via `make` if available).

**Layout:** Default horizontal with `prompt_position = 'bottom'`,
`selection_caret = '  '`, `winblend = 10`, `border = true`,
`path_display = 'smart'`.

**Keymaps:** ~40 keymaps defined via lazy.nvim's `keys` table,
including:
- `<leader>t*` — built-in pickers (buffers, files, grep, etc.)
- `<leader>tcs*` — custom file searches (/, ~/mps, /var, etc.)
- `g[ldrt]*` — LSP pickers (definitions, references, type defs,
  symbols, diagnostics)
- `gd`, `gr` — override default LSP bindings

---

## undotree

[mbbill/undotree](https://github.com/mbbill/undotree) — visual
undo history browser.

Key: `<leader>u` toggles the undotree window.

---

## which-key

[folke/which-key.nvim](https://github.com/folke/which-key.nvim) —
keybinding popup helper.

Uses default `opts = {}`. Shows keybinding hints after pressing
a prefix key (leader, `g`, etc.) with a configurable delay.

---

## autopairs

[windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) —
auto-pair brackets and quotes.

Minimal setup: default `opts = {}`. Automatically pairs brackets,
quotes, and tags.

---

## LSP (native)

Native LSP configuration using Neovim 0.11+ APIs
(`vim.lsp.config`, `vim.lsp.enable`) at [`lua/init/lsp.lua`](lua/init/lsp.lua).

**21 language servers configured:**
- Python: `ruff`, `pyright`
- Web: `ts_ls`, `html`, `cssls`, `jsonls`
- Shell: `bashls`
- Docker: `dockerls`, `docker_compose_language_service`
- Rust: `rust_analyzer`
- C/C++: `clangd`
- Go: `gopls`
- Lua: `lua_ls`
- Markdown: `marksman`
- TOML: `taplo`
- And more...

Key behaviours:

- Default capabilities register `snippetSupport` for all servers.
- Servers auto-installed via mason.nvim's `ensure_installed`.
- Inlay hints enabled globally.
- Diagnostic signs use custom Unicode glyphs.
- `LspAttach` auto-command sets buffer-local keymaps for
  navigation (gD, gh, gk, gsh, gK), code actions (gca, gn, gtf),
  and diagnostics ([d, ]d).

See [`docs/README-OPTIONS.md`](docs/README-OPTIONS.md) for related
vim options.