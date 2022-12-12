vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  -- lsp config 
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
  use "onsails/lspkind.nvim"
  use 'nvim-treesitter/nvim-treesitter'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'windwp/nvim-autopairs'
  use "L3MON4D3/LuaSnip"
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
  use {
    "glepnir/lspsaga.nvim",
     branch = "main",
}
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-surround'
  use 'vim-scripts/ReplaceWithRegister'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  end)
