.PHONY: lint check health validate deps

lint:       ## Run luacheck on all Lua files
	luacheck lua/

check:      ## Check Neovim config loads without errors
	XDG_CONFIG_HOME=$(HOME)/.config/nvim-dev nvim --headless -c "q"

health:    ## Run :checkhealth internally
	XDG_CONFIG_HOME=$(HOME)/.config/nvim-dev nvim --headless -c "checkhealth" -c "q"

validate:   ## Full validation suite
	$(MAKE) lint
	$(MAKE) check

deps:       ## Install external system dependencies (requires sudo)
	@echo "=== System packages (apt) ==="
	@sudo apt update
	@sudo apt install -y shellcheck cmake clangd build-essential pkg-config libssl-dev

	@echo ""
	@echo "=== Python debug adapter ==="
	@pip3 install debugpy

	@echo ""
	@echo "=== Lua tools (if cargo available) ==="
	@cargo install stylua 2>/dev/null || echo "stylua: already installed or cargo not available"
	@luacheck --version >/dev/null 2>&1 && echo "luacheck: already installed" || echo "luacheck: not found (install via: apt install luacheck)"

	@echo ""
	@echo "=== Node.js tools ==="
	@npm install -g tree-sitter-cli 2>/dev/null || echo "tree-sitter-cli: skipped (npm not available)"
	@cargo install tree-sitter-cli 2>/dev/null || echo "tree-sitter-cli: already installed via cargo"

	@echo ""
	@echo "=== Neovim plugins ==="
	@echo "Run 'nvim +Lazy! sync' to install all plugins"
	@echo ""
	@echo "=== Mason LSP servers ==="
	@echo "LSP servers auto-install on first use of each language"
	@echo "To force install all: nvim +MasonInstallAll +q"