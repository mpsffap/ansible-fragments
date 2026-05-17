# Debugging

Debugging plugins from [`lua/debugging/`](lua/debugging/).

---

## Debug Adapter Protocol

### Core DAP

**File**: [`debugging/core.lua`](lua/debugging/core.lua)  
**Repository**: [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)  
**Description**: Core DAP implementation for multi-language debugging

### DAP UI

**Repository**: [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)  
**Description**: UI for DAP (variables, breakpoints, stack traces)

### Python Debug

**Repository**: [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)  
**Description**: Python debug adapter

### Go Debug

**Repository**: [mfussenegger/nvim-dap-go](https://github.com/mfussenegger/nvim-dap-go)  
**Description**: Go debug adapter

### Rust Debug

Configured via builtin DAP for C++ (lldb-mi)

---

## Keybinds

| Keys | Action |
|------|--------|
| `<F5>` / `<F9>` | Start/Continue debug |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` / `<S-F5>` | Terminate |
| `<leader>bb` | Toggle breakpoint |
| `<leader>bc` | Clear all breakpoints |
| `<leader>bo` | Toggle breakpoint options |
| `<leader>bl` | List breakpoints |

See [`docs/README-TOOLS.md`](docs/README-TOOLS.md) for GDB integration.