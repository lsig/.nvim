local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git",
			"dist",
			"yarn.lock",
			"profile_list_images",
		},
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		buffers = {
			theme = "dropdown",
			winblend = 10,
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer + actions.move_to_top,
				},
			},
			sort_mru = true,
		},
		resume = {
			theme = "ivy",
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
			winblend = 10,
		},
		git_files = {
			show_untracked = true,
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},
	},
})

-- Open Telescope on startup if the first argument is a directory
local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		local first_arg = vim.v.argv[3]
		if first_arg and vim.fn.isdirectory(first_arg) == 1 then
			-- Vim creates a buffer for folder. Close it.
			vim.cmd(":bd 1")
			require("telescope.builtin").find_files({ search_dirs = { first_arg } })
		end
	end,
	group = ts_group,
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
