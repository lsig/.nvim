local nnoremap = require("lsig.keymap").nnoremap 
local inoremap = require("lsig.keymap").inoremap

-- normal mode remaps
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")

nnoremap("<leader>ot", "<cmd>:NvimTreeOpen<CR>")
nnoremap("<leader>ct", "<cmd>:NvimTreeClose<CR>")

nnoremap("<leader>sv", "<C-w>v")
nnoremap("<leader>sh", "<C-w>s")
nnoremap("<leader>se", "<C-w>=")
nnoremap("<leader>sx", "<cmd>:close<CR>")

nnoremap("<leader>to", "<cmd>:tabnew<CR>")
nnoremap("<leader>tx", "<cmd>:tabclose<CR>")
nnoremap("<leader>tn", "<cmd>:tabn<CR>")
nnoremap("<leader>tp", "<cmd>:tabp<CR>")

-- lsp 
nnoremap("gf", "<silent>:Lspsaga lsp_finder<CR>") -- show definition, references
nnoremap("gD", "<cmd>:lua vim.lsp.buf.declaration()<CR>") -- got to declaration
nnoremap("gd", "<silent>:Lspsaga peek_definition<CR>") -- see definition and make edits in window
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
nnoremap("<leader>ca", "<silent>:Lspsaga code_action<CR>") -- see available code actions
nnoremap("<leader>rn", "<silent>:Lspsaga rename<CR>") -- smart rename
nnoremap("<leader>D", "<silent>:Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
nnoremap("<leader>d", "<silent>:Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
nnoremap("[d", "<silent>:Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
nnoremap("]d", "<silent>:Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
nnoremap("K", "<silent>:Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
nnoremap("<leader>o", "<cmd>LSoutlineToggle<CR>") -- see outline on right hand side
nnoremap("<A-d>","<silent>:Lspsaga open_floatterm")

-- insert mode remaps
inoremap("jk", "<ESC>")

