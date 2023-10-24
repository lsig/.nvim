-- normal mode remaps

-- telescope remaps
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown())
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>pv", ":Telescope file_browser<CR>", { silent = true })

-- window remaps
vim.keymap.set("n", "<leader>cd", ":cd %:p:h", { silent = true })
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sl", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>s-", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<leader>s+", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { silent = true })

-- tab remaps
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { silent = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { silent = true })

-- buffer remaps
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>", { silent = true })

-- Git remaps
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gp", require("gitsigns").prev_hunk, { desc = "[G]o to [P]revious Hunk" })
vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { desc = "[G]o to [N]ext Hunk" })
vim.keymap.set("n", "<leader>ph", require("gitsigns").preview_hunk, { desc = "[P]review [H]unk" })
vim.keymap.set("n", "<leader>gb", require("gitsigns").blame_line, { desc = "[G]it [B]lame" })

-- remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<BS>", "ciw")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- undotree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { silent = true })

-- insert mode remaps
vim.keymap.set("i", "<C-c>", "<ESC>")

-- visual mode remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- x mode remaps
vim.keymap.set("x", "<leader>p", [["_dP]])

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
