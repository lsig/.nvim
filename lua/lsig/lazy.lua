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
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "onsails/lspkind.nvim" },

			-- Additional lua configuration, makes nvim stuff amazing!
			{ "folke/neodev.nvim", opts = {} },
		},
	},
	{
		"creativenull/efmls-configs-nvim",
		version = "v1.x.x",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} },
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
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	-- Autocomplete
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v1.2.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
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
		opts = {},
		event = "VeryLazy",
	},
	{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
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
	-- Tpope, Folke and more
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{ "mbbill/undotree", event = "VeryLazy" },
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "vim-scripts/ReplaceWithRegister", event = "VeryLazy" },
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
			"marilari88/neotest-vitest",
		},
		event = "VeryLazy",
	},
})
