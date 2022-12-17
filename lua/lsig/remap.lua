local nnoremap = require("lsig.keymap").nnoremap
local inoremap = require("lsig.keymap").inoremap
local vnoremap = require("lsig.keymap").vnoremap
local xnoremap = require("lsig.keymap").xnoremap

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

nnoremap("<leader>gs", "<cmd>:Git<CR>")

nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "C-d>zz")
nnoremap("<C-u>", "C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')
nnoremap("Q", "<nop>")

-- lspsaga
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

-- insert mode remaps
inoremap("jk", "<ESC>")

-- visual mode remaps
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("<leader>y", '"+y')

-- x mode remaps
xnoremap("<leader>p", '"_dP')
