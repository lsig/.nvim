local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	{ "folke/tokyonight.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "onsails/lspkind.nvim" },

			-- Additional lua configuration, makes nvim stuff amazing!
			{ "folke/neodev.nvim" },
		},
	},
	{ "j-hui/fidget.nvim", opts = { text = { spinner = "dots" } }, event = "LspAttach" },
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({
				preview = {
					lines_above = 0,
					lines_below = 10,
				},
				scroll_preview = {
					scroll_down = "<C-f>",
					scroll_up = "<C-b>",
				},
				request_timeout = 2000,

				symbol_in_winbar = {
					enable = false,
					separator = "  ",
					show_file = false,
				},
			})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
	-- Autocomplete
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v1.2.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "rafamadriz/friendly-snippets", event = "VeryLazy" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"windwp/nvim-autopairs",
		-- config = function()
		-- 	require("nvim-autopairs").setup({})
		-- end,
		opts = {},
		event = "VeryLazy",
	},
	{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
	--null ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "jayp0521/mason-null-ls.nvim" },
	},
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- git integration
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ -- Adds git releated signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	-- Tpope and more
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{ "echasnovski/mini.surround", version = false },
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		event = "VeryLazy",
	},

	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "vim-scripts/ReplaceWithRegister", event = "VeryLazy" },
})
