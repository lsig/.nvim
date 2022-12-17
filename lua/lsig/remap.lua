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

-- insert mode remaps
inoremap("jk", "<ESC>")

-- visual mode remaps
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
vnoremap("<leader>y", '"+y')

-- x mode remaps
xnoremap("<leader>p", '"_dP')
