require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"pyright",
		"clangd",
		"html",
		"cssls",
		"tsserver",
	},
})

local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
	ensure_installed = {
		"prettierd",
		"stylua",
		"eslint_d",
		"pyproject_flake8",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig")["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})
require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
})
require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig")["clangd"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
require("lspconfig")["rust_analyzer"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})

require("lspconfig")["lua_ls"].setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig").emmet_ls.setup({
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})
