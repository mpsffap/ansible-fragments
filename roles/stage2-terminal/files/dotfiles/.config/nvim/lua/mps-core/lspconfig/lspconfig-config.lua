-- Instead of lspconfig = require('lspconfig')
-- Use the newer way to access server configs if you are on the latest lspconfig
-- local lspconfig = vim.lsp.config
-- local lspconfig = vim.lsp.util
local lspconfig = require("lspconfig") -- The warning happens here
-- local lsputil = require("lspconfig.util")

-- Note: If your version of lspconfig is transitioning,
-- check if you can simply use:
-- local lspconfig = require('lspconfig') -- The warning happens here

local on_attach = function(client, bufnr)
	client.server_capabilities.completionProvider = true
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
	client.server_capabilities.hoverProvider = true
	client.server_capabilities.signatureHelpProvider = true
	-- print("Lsp '", client.name, "' attached to buffer ", bufnr)
end
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

local config = function()
	-- ############################################################################
	-- # Setup
	-- ############################################################################
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
	local capabilities = cmp_nvim_lsp.default_capabilities()
	local vscode_capabilities = vim.lsp.protocol.make_client_capabilities()
	vscode_capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- ############################################################################
	-- # Linters and formatters
	-- ############################################################################
	vim.lsp.config("html", {
		on_attach = on_attach,
		capabilities = vscode_capabilities,
		filetypes = { "html", "templ" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		},
		settings = {},
		single_file_support = true,
	})
	vim.lsp.enable("html")

	vim.lsp.config("cssls", {
		-- vim.lsp.config("cssls", {
		on_attach = on_attach,
		capabilities = vscode_capabilities,
		filetypes = { "css", "scss", "less" },
		provideFormatter = true,
		settings = {
			css = {
				validate = true,
			},
			less = {
				validate = true,
			},
			scss = {
				validate = true,
			},
		},
		root_dir = lspconfig.util.root_pattern("package.json", ".git"),
		single_file_support = true,
	})
	vim.lsp.enable("cssls")
	vim.lsp.config("ts_ls", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"javascript",
		},
		settings = {},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})
	vim.lsp.enable("ts_ls")
	vim.lsp.config("dockerls", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"dockerfile",
		},
		settings = {},
		root_dir = lspconfig.util.root_pattern("Dockerfile"),
		single_file_support = true,
	})
	vim.lsp.enable("dockerls")
	vim.lsp.config("docker_compose_language_service", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"yaml.docker-compose",
		},
		settings = {},
		root_dir = lspconfig.util.root_pattern(
			"docker-compose.yaml",
			"docker-compose.yml",
			"compose.yaml",
			"compose.yml"
		),
		single_file_support = true,
	})
	vim.lsp.enable("docker_compose_language_service")
	vim.lsp.config("texlab", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"tex",
			"plaintex",
			"bib",
		},
		settings = {
			texlab = {
				auxDirectory = ".",
				bibtexFormatter = "texlab",
				build = {
					args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
					executable = "latexmk",
					forwardSearchAfter = false,
					onSave = false,
				},
				chktex = {
					onEdit = false,
					onOpenAndSave = false,
				},
				diagnosticsDelay = 300,
				formatterLineLength = 80,
				forwardSearch = {
					args = {},
				},
				latexFormatter = "latexindent",
				latexindent = {
					modifyLineBreaks = false,
				},
			},
		},
		single_file_support = true,
	})
	vim.lsp.enable("texlab")
	vim.lsp.config("jsonls", {
		on_attach = on_attach,
		capabilities = vscode_capabilities,
		filetypes = {
			"json",
			"jsonc",
		},
		init_options = {
			provideFormatter = true,
		},
		settings = {},
		root_dir = lspconfig.util.find_git_ancestor(),
		single_file_support = true,
	})
	vim.lsp.enable("jsonls")
	vim.lsp.config("marksman", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"markdown",
			"markdown.mdx",
		},
		settings = {},
		root_dir = lspconfig.util.root_pattern(".git", ".marksman.toml"),
		single_file_support = true,
	})
	vim.lsp.enable("marksman")
	vim.lsp.config("lemminx", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"xml",
			"xsd",
			"xsl",
			"xslt",
			"svg",
		},
		settings = {},
		root_dir = lspconfig.util.find_git_ancestor(),
		single_file_support = true,
	})
	vim.lsp.enable("lemminx")

	vim.lsp.config("lua_ls", {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.env.VIMRUNTIME .. "/lua",
						vim.fn.expand("config") .. "/lua",
					},
				},
			},
		},
	})
	vim.lsp.enable("lua_ls")
	vim.lsp.config("bashls", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"sh",
			"bash",
		},
		single_file_support = true,
		settings = {
			bashIde = {
				shellcheckPath = "shellcheck",
				shellcheckArguments = "--color=always -S style -W 1 -x",
				logLevel = "info",
				includeAllWorkspaceSymbols = true,
				enableSourceErrorDiagnostics = true,
				backgroundAnalysisMaxFiles = 500,
				globPattern = "*@(.sh|.bash|.inc|.bash|.command)",
				explainshellEndpoint = "",
			},
		},
	})
	vim.lsp.enable("bashls")
	vim.lsp.config("rust_analyzer", {
		settings = {
			["rust-analyzer"] = {},
		},
	})
	vim.lsp.enable("rust_analyzer")
	vim.lsp.config("ruff", {
		on_attach = on_attach,
		capabilities = capabilities,
	})
	vim.lsp.enable("ruff")
	vim.lsp.config("pyright", {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				disableLanguageServices = false,
				disableTaggedHints = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autosearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
				venvPath = vim.fn.getcwd() .. "/.venv/default",
				pythonPath = vim.fn.getcwd() .. "/.venv/default/bin/python",
			},
			python = vim.fn.getcwd() .. "/.venv/bin/python",
		},
	})
	vim.lsp.enable("pyright")
	vim.lsp.config("taplo", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"toml",
			"lsp",
			"stdio",
		},
		settings = {},
		root_dir = lspconfig.util.root_pattern(".toml", ".git"),
		single_file_support = true,
	})
	vim.lsp.enable("taplo")
	vim.lsp.config("vimls", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"vim",
		},
		settings = {},
		init_options = {
			diagnostic = {
				enable = true,
			},
			indexes = {
				count = 3,
				gap = 100,
				projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
				runtimepath = true,
			},
			isNeovim = true,
			iskeyword = "@,48-57,_,192-255,-#",
			runtimepath = "",
			suggest = {
				fromRuntimepath = true,
				fromVimruntime = true,
			},
			vimruntime = "",
		},
		single_file_support = true,
	})
	vim.lsp.enable("vimls")
	vim.lsp.config("nginx_language_server", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"nginx",
		},
		settings = {},
		single_file_support = true,
	})
	vim.lsp.enable("nginx_language_server")
	vim.lsp.config("cmake", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"cmake",
		},
		settings = {},
		init_options = {
			buildDirectory = "build",
		},
		root_dir = lspconfig.util.root_pattern("CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake"),
		single_file_support = true,
	})
	vim.lsp.enable("cmake")
	vim.lsp.config("clangd", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"c",
			"cpp",
			"objc",
			"objcpp",
			"cuda",
			"proto",
		},
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
		settings = {},
		init_options = {
			buildDirectory = "build",
		},
		root_dir = lspconfig.util.root_pattern(
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_commands.json",
			"compile_flags.txt",
			"configure.ac",
			".git"
		),
		single_file_support = true,
	})
	vim.lsp.enable("clangd")
	vim.lsp.config("csharp_ls", {
		on_attach = on_attach,
		capabilities = vscode_capabilities,
		filetypes = {
			"cs",
		},
		settings = {},
		init_options = {
			AutomaticWorkspaceInit = true,
		},
		single_file_support = true,
	})
	vim.lsp.enable("csharp_ls")
	vim.lsp.config("omnisharp", {
		on_attach = on_attach,
		capabilities = vscode_capabilities,
		cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
		filetypes = {
			"cs",
		},
		settings = {},
		init_options = {
			AutomaticWorkspaceInit = true,
		},
		single_file_support = true,
		root_dir = lspconfig.util.root_pattern(".csproject"),
		-- Additional configuration can be added here
	})
	vim.lsp.enable("omnisharp")
	vim.lsp.config("ansiblels", {
		filetypes = {
			"yaml",
			"yml",
		},
		settings = {
			ansible = {
				ansible = {
					path = "ansible",
					useFullyQualifiedCollectionNames = true,
				},
				ansibleLint = {
					enabled = true,
					path = "ansible-lint",
				},
				executionEnvironment = {
					enabled = false,
				},
				python = {
					interpreterPath = "python",
				},
				completion = {
					provideRedirectModules = true,
					provideModuleOptionAliases = true,
				},
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})
	vim.lsp.enable("ansiblels")
	-- ############################################################################
	-- # Linters
	-- ############################################################################
	local luacheck = require("efmls-configs.linters.luacheck")
	local ruff = require("efmls-configs.linters.ruff")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local stylint = require("efmls-configs.linters.stylelint")
	local ansible_lint = require("efmls-configs.linters.ansible_lint")
	local hadolint = require("efmls-configs.linters.hadolint")
	local markdownlint = require("efmls-configs.linters.markdownlint")
	local jqlint = require("efmls-configs.linters.jq")
	local chktex = require("efmls-configs.linters.chktex")
	local yamllint = require("efmls-configs.linters.yamllint")
	local vint = require("efmls-configs.linters.vint")
	local cmakelint = require("efmls-configs.linters.cmake_lint")
	local clangtidy = require("efmls-configs.linters.clang_tidy")
	local mcs = require("efmls-configs.linters.mcs")

	local xmllint = {
		lintCommand = "xmllint --noout --relaxng --schema /path/to/your/schema.rng -",
		lintStdin = true,
		lintFormats = { "%f:%l: %m" },
	}
	-- ############################################################################
	-- # Formatters
	-- ############################################################################
	local stylua = require("efmls-configs.formatters.stylua")
	local black = require("efmls-configs.formatters.black")
	local prettierd = require("efmls-configs.formatters.prettier_d")
	local shellharden = require("efmls-configs.formatters.shellharden")
	local mdformat = require("efmls-configs.formatters.mdformat")
	local jqformat = require("efmls-configs.formatters.jq")
	local latexindent = require("efmls-configs.formatters.latexindent")
	local taplo = require("efmls-configs.formatters.taplo")
	local gersemi = require("efmls-configs.formatters.gersemi")
	local clangformat = require("efmls-configs.formatters.clang_format")
	local xmlformatter = { formatCommand = "xmlformat -", formatStdin = true }
	-- local dotnetformatter = { formatCommand = "dotnet format $(ROOT)", formatStdin = false }
	-- ############################################################################
	-- # Setup
	-- ############################################################################
	vim.lsp.config("efm", {
		on_attach = on_attach,
		capabilities = capabilities,
		filetype = {
			"lua",
			"python",
			"typescript",
			"javascript",
			"sh",
			"html",
			"templ",
			"css",
			"scss",
			"less",
			"templ",
			"dockerfile",
			"markdown",
			"markdown.mdx",
			"json",
			"jsonc",
			"tex",
			"plaintex",
			"bib",
			"xml",
			"xsd",
			"xsl",
			"xslt",
			"svg",
			"yaml",
			"yml",
			"toml",
			"lsp",
			"stdio",
			"vim",
			"cmake",
			"c",
			"c++",
			"objc",
			"objc++",
			"cuda",
			"proto",
			"cs",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				sh = { shellcheck },
				lua = { luacheck, stylua },
				python = { ruff, black },
				typescript = { eslint_d, prettierd },
				javascript = { eslint_d, prettierd },
				html = { stylint, prettierd },
				templ = { stylint, prettierd },
				css = { stylint, prettierd },
				scss = { stylint, prettierd },
				less = { stylint, prettierd },
				dockerfile = { hadolint },
				markdown = { markdownlint, mdformat },
				json = { jqlint, jqformat },
				jsonc = { jqlint, jqformat },
				tex = { chktex, latexindent },
				plaintex = { chktex, latexindent },
				bib = { latexindent, chktex },
				xml = { xmllint, xmlformatter },
				xsd = { xmllint, xmlformatter },
				xsl = { xmllint, xmlformatter },
				xslt = { xmllint, xmlformatter },
				svg = { xmllint, xmlformatter },
				yaml = { yamllint, prettierd },
				ansiblels = { ansible_lint, prettierd },
				yml = { yamllint, prettierd },
				toml = { eslint_d, taplo },
				lsp = { eslint_d, taplo },
				stdio = { eslint_d, taplo },
				vim = { vint },
				cmake = { cmakelint, gersemi },
				c = { clangtidy, clangformat },
				cpp = { clangtidy, clangformat },
				objc = { clangtidy, clangformat },
				objcpp = { clangtidy, clangformat },
				cs = { mcs },
			},
		},
	})
end
config()
