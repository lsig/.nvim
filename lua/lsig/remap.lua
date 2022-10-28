local nnoremap = require("lsig.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")

nnoremap("<leader><CR>", "<cmd>:NvimTreeToggle<CR>")
nnoremap("<leader>ot", "<cmd>:NvimTreeOpen<CR>")

nnoremap("<leader>tt", "<cmd><C-w><CR>")



