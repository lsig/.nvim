local nnoremap = require("lsig.keymap").nnoremap local inoremap = require("lsig.keymap").inoremap

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

-- insert mode remaps
inoremap("jk", "<ESC>")

