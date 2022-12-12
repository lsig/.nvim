local saga = require("lspsaga")
local nnoremap = require("lsig.keymap").nnoremap

saga.init_lsp_saga({
	-- keybinds for navigation in lspsaga window
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	-- use enter to open file with finder
	finder_action_keys = {
		open = "<CR>",
	},
	-- use enter to open file with definition preview
	definition_action_keys = {
		edit = "<CR>",
	},
})

-- show definition, references
nnoremap("gf", "<silent>:Lspsaga lsp_finder<CR>")
-- got to declaration
nnoremap("gD", "<cmd>:lua vim.lsp.buf.declaration()<CR>")
-- see definition and make edits in window
nnoremap("gd", "<silent>:Lspsaga peek_definition<CR>")
-- go to implementation
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- see available code actions
nnoremap("<leader>ca", "<silent>:Lspsaga code_action<CR>")
-- smart rename
nnoremap("<leader>rn", "<silent>:Lspsaga rename<CR>")
-- show  diagnostics for line
nnoremap("<leader>D", "<silent>:Lspsaga show_line_diagnostics<CR>")
-- show diagnostics for cursor
nnoremap("<leader>d", "<silent>:Lspsaga show_cursor_diagnostics<CR>")
-- jump to previous diagnostic in buffer
nnoremap("[d", "<silent>:Lspsaga diagnostic_jump_prev<CR>")
-- jump to next diagnostic in buffer
nnoremap("]d", "<silent>:Lspsaga diagnostic_jump_next<CR>")
-- show documentation for what is under cursor
nnoremap("K", "<silent>:Lspsaga hover_doc<CR>")
-- see outline on right hand side
nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>")
-- Float terminal
nnoremap("<A-d>", "<silent>:Lspsaga open_floatterm")
