require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "lua", "rust", "python", "typescript", "javascript"},
  ensure_installed = {"lua", "typescript", "python", "javascript"},
  sync_install = false,
  highlight = {enable = true, additional_vim_regex_highlighting = false},
  indent = {enable = true},
  autotag = {enable = true},
}
