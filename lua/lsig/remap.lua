local nnoremap = require("lsig.keymap").nnoremap
local inoremap = require("lsig.keymap").inoremap
local vnoremap = require("lsig.keymap").vnoremap
local xnoremap = require("lsig.keymap").xnoremap

-- normal mode remaps

-- telescope remaps
nnoremap("<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>sg", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader><space>", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<leader>/", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
nnoremap("<leader>?", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>pv", "<cmd>Telescope file_browser<CR>")

nnoremap("<leader>cd", "<cmd>:cd %:p:h<CR>")

-- window remaps
nnoremap("<leader>sv", "<C-w>v")
nnoremap("<leader>sh", "<C-w>s")
nnoremap("<leader>se", "<C-w>=")
nnoremap("<leader>s-", "<cmd>vertical resize -5<CR>")
nnoremap("<leader>s+", "<cmd>vertical resize +5<CR>")
nnoremap("<leader>sx", "<cmd>:close<CR>")

-- tab remaps
nnoremap("<leader>to", "<cmd>:tabnew<CR>")
nnoremap("<leader>tx", "<cmd>:tabclose<CR>")
nnoremap("<leader>tn", "<cmd>:tabn<CR>")
nnoremap("<leader>tp", "<cmd>:tabp<CR>")

-- buffer remaps
nnoremap("<leader>bn", "<cmd>:bnext<CR>")
nnoremap("<leader>bp", "<cmd>:bprevious<CR>")
nnoremap("<leader>bx", "<cmd>:bdelete<CR>")

-- Git remaps
nnoremap("<leader>gs", "<cmd>:Git<CR>")
nnoremap("<leader>hp", "<cmd>:Gitsigns preview_hunk<CR>")
nnoremap("<leader>gn", "<cmd>:Gitsigns next_hunk<CR>")
nnoremap("<leader>gp", "<cmd>:Gitsigns prev_hunk<CR>")
nnoremap("<leader>gb", "<cmd>:Gitsigns blame_line<CR>")

nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("<BS>", "ciw")
nnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')
nnoremap("Q", "<nop>")

-- lspsaga remaps
nnoremap("gf", "<cmd>:Lspsaga lsp_finder<CR>", { silent = true }) -- show definition, references
nnoremap("gD", "<cmd>:Lspsaga goto_definition<CR>", { silent = true }) -- got to declaration
nnoremap("gd", "<cmd>:Lspsaga peek_definition<CR>", { silent = true }) -- see definition and make edits in window
nnoremap("<leader>gr", "<cmd>Telescope lsp_references<CR>", { silent = true }) -- go to implementation
nnoremap("<leader>td", "<cmd>:Lspsaga peek_type_definition<CR>", { silent = true })
nnoremap("<leader>tD", "<cmd>:Lspsaga goto_type_definition<CR>", { silent = true })
nnoremap("<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { silent = true })
nnoremap("<leader>ca", "<cmd>:Lspsaga code_action<CR>", { silent = true }) -- see available code actions
nnoremap("<leader>rn", "<cmd>:Lspsaga rename<CR>", { silent = true }) -- smart rename
nnoremap("<leader>D", "<cmd>:Lspsaga show_line_diagnostics<CR>", { silent = true }) -- show  diagnostics for line
nnoremap("<leader>d", "<cmd>:Lspsaga show_cursor_diagnostics<CR>", { silent = true }) -- show diagnostics for cursor
nnoremap("[d", "<cmd>:Lspsaga diagnostic_jump_prev<CR>", { silent = true }) -- jump to previous diagnostic in buffer
nnoremap("]d", "<cmd>:Lspsaga diagnostic_jump_next<CR>", { silent = true }) -- jump to next diagnostic in buffer
nnoremap("K", "<cmd>:Lspsaga hover_doc ++keep<CR>", { silent = true }) -- show documentation for what is under cursor
nnoremap("<leader>o", "<cmd>:Lspsaga outline<CR>", { silent = true }) -- see outline on right hand side
nnoremap("<leader>tt", "<cmd>:Lspsaga term_toggle<CR>", { silent = true }) -- Float terminal

-- trouble remaps
nnoremap("xx", "<cmd>:TroubleToggle<CR>", { silent = true })
nnoremap("xw", "<cmd>:TroubleToggle workspace_diagnostics<CR>", { silent = true })
nnoremap("xd", "<cmd>:TroubleToggle document_diagnostics<CR>", { silent = true })
nnoremap("xl", "<cmd>:TroubleToggle loclist<CR>", { silent = true })
nnoremap("xq", "<cmd>:TroubleToggle quickfix<CR>", { silent = true })
nnoremap("gR", "<cmd>:TroubleToggle lsp_references<CR>", { silent = true })

-- undotree
nnoremap("<leader>u", "<cmd>:UndotreeToggle<CR>")

-- insert mode remaps
inoremap("<C-c>", "<ESC>")

-- visual mode remaps
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("<leader>y", '"+ygv<ESC>')
vnoremap("y", "ygv<ESC>")

-- x mode remaps
xnoremap("<leader>p", '"_dP')

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
