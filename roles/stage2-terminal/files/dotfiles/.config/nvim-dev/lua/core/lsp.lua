vim.lsp.config["*"] = {
	capabilities = {
		textDocument = {
			completion = {
				completionItem = { snippetSupport = true },
			},
		},
	},
}

-- Auto-install LSP servers via Mason (deferred, non-blocking)
vim.schedule(function()
	-- Use Mason's registry to check installed packages
	local registry = require("mason-registry")
	local ok, err = pcall(function()
		registry.ensure_installed({
			"ruff",
			"pyright",
			"lua-language-server",
			"html-lsp",
			"css-lsp",
			"typescript-language-server",
			"dockerfile-language-server",
			"docker-compose-language-service",
			"json-lsp",
			"marksman",
			"bash-language-server",
			"rust-analyzer",
			"clangd",
			"cmake-language-server",
			"vim-language-server",
			"texlab",
			"lemminx",
			"taplo",
			"ansible-language-server",
			"omnisharp",
		}, function()
			-- on success
		end, function(package, error)
			-- on failure
			vim.notify("Failed to install " .. package .. ": " .. error, vim.log.levels.WARN)
		end)
	end)
	if not ok then
		-- Mason not ready yet, ignore
	end
end)

vim.lsp.config.ruff = {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	settings = {
		ruff = {
			lineLength = 88,
			lint = { extendSelect = { "I" } },
			format = { preview = true },
		},
	},
}

vim.lsp.enable("ruff")

vim.lsp.config.pyright = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
}

vim.lsp.enable("pyright")

vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
}

vim.lsp.enable("lua_ls")

-- HTML
vim.lsp.config.html = {
	cmd = { "html-lsp", "--stdio" },
	filetypes = { "html", "templ" },
	root_markers = { "package.json", ".git" },
}
vim.lsp.enable("html")

-- CSS
vim.lsp.config.cssls = {
	cmd = { "css-lsp", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
	settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	},
}
vim.lsp.enable("cssls")

-- TypeScript/JavaScript
vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "javascript" },
	root_markers = { "package.json", "tsconfig.json", ".git" },
}
vim.lsp.enable("ts_ls")

-- Docker
vim.lsp.config.dockerls = {
	cmd = { "dockerfile-language-server", "--stdio" },
	filetypes = { "dockerfile" },
	root_markers = { "Dockerfile", ".git" },
}
vim.lsp.enable("dockerls")

-- Docker Compose
vim.lsp.config.docker_compose_language_service = {
	cmd = { "docker-compose-language-service", "stdio" },
	filetypes = { "yaml.docker-compose" },
	root_markers = {
		"docker-compose.yaml",
		"docker-compose.yml",
		"compose.yaml",
		"compose.yml",
	},
}
vim.lsp.enable("docker_compose_language_service")

-- JSON
vim.lsp.config.jsonls = {
	cmd = { "json-lsp", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { ".git" },
}
vim.lsp.enable("jsonls")

-- Markdown
vim.lsp.config.marksman = {
	cmd = { "marksman" },
	filetypes = { "markdown", "markdown.mdx" },
	root_markers = { ".git", ".marksman.toml" },
}
vim.lsp.enable("marksman")

-- LaTeX
vim.lsp.config.texlab = {
	cmd = { "texlab" },
	filetypes = { "tex", "plaintex", "bib" },
	settings = {
		texlab = {
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
			},
			chktex = { onEdit = false, onOpenAndSave = false },
			diagnosticsDelay = 300,
			formatterLineLength = 80,
		},
	},
}
vim.lsp.enable("texlab")

-- XML
vim.lsp.config.lemminx = {
	cmd = { "lemminx" },
	filetypes = { "xml", "xsd", "xsl", "xslt", "svg" },
	root_markers = { ".git" },
}
vim.lsp.enable("lemminx")

-- Bash
vim.lsp.config.bashls = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
	root_markers = { ".git" },
	settings = {
		bashIde = {
			shellcheckPath = "shellcheck",
			shellcheckArguments = "--color=always -S style -W 1 -x",
		},
	},
}
vim.lsp.enable("bashls")

-- Rust
vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", ".git" },
	settings = {
		["rust-analyzer"] = {},
	},
}
vim.lsp.enable("rust_analyzer")

-- TOML
vim.lsp.config.taplo = {
	cmd = { "taplo" },
	filetypes = { "toml" },
	root_markers = { ".toml", ".git" },
}
vim.lsp.enable("taplo")

-- Vim
vim.lsp.config.vimls = {
	cmd = { "vim-language-server", "--stdio" },
	filetypes = { "vim" },
	root_markers = { ".git" },
	settings = {
		diagnostic = { enable = true },
		indexes = { count = 3, gap = 100 },
		isNeovim = true,
	},
}
vim.lsp.enable("vimls")

-- Nginx (disabled - doesn't support --stdio, requires TCP)
-- vim.lsp.config.nginx_language_server = {
-- 	cmd = { "nginx-language-server" },
-- 	filetypes = { "nginx" },
-- 	root_markers = { ".git" },
-- }
-- vim.lsp.enable("nginx_language_server")

-- CMake
vim.lsp.config.cmake = {
	cmd = { "cmake-language-server" },
	filetypes = { "cmake" },
	root_markers = { "CMakeLists.txt", "CMakePresets.json", ".git" },
	settings = {
		buildDirectory = "build",
	},
}
vim.lsp.enable("cmake")

-- C/C++
vim.lsp.config.clangd = {
	cmd = { "clangd", "--offset-encoding=utf-16" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = {
		".clangd",
		".clang-tidy",
		"compile_commands.json",
		"compile_flags.txt",
		".git",
	},
}
vim.lsp.enable("clangd")

-- C#
vim.lsp.config.csharp_ls = {
	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	filetypes = { "cs" },
	root_markers = { ".csproj", ".git" },
	settings = {
		AutomaticWorkspaceInit = true,
	},
}
vim.lsp.enable("csharp_ls")

-- Ansible
vim.lsp.config.ansiblels = {
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "yaml", "yml" },
	root_markers = { ".ansible-lint", ".git" },
	settings = {
		ansible = {
			ansible = { path = "ansible", useFullyQualifiedCollectionNames = true },
			ansibleLint = { enabled = true, path = "ansible-lint" },
			completion = { provideRedirectModules = true },
		},
	},
}
vim.lsp.enable("ansiblels")

-- Inlay hints
vim.lsp.inlay_hint.enable(true)

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "✘", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "▲", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ", numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "⚑", numhl = "DiagnosticSignHint" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("core-lsp", { clear = true }),
	callback = function(ev)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
		end

		-- Navigation / info
		map("n", "gD", vim.lsp.buf.declaration, "[LSP] Declaration")
		map("n", "gh", vim.lsp.buf.hover, "[LSP] Hover")
		map("n", "gk", vim.lsp.buf.hover, "[LSP] Hover (alt)")
		map("n", "gsh", vim.lsp.buf.signature_help, "[LSP] Signature help")
		map("n", "gK", vim.lsp.buf.signature_help, "[LSP] Signature help (alt)")

		-- Code actions
		map("n", "gca", vim.lsp.buf.code_action, "[LSP] Code action")
		map("n", "gn", vim.lsp.buf.rename, "[LSP] Rename")
		map("n", "gtf", vim.lsp.buf.format, "[LSP] Format")

		-- Diagnostics
		map("n", "[d", vim.diagnostic.goto_prev, "[LSP] Prev diagnostic")
		map("n", "]d", vim.diagnostic.goto_next, "[LSP] Next diagnostic")
	end,
})
