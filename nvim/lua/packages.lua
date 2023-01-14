vim.cmd [[packadd packer.nvim]]
require("packer").startup(function(use)
  use "wbthompson/packer.nvim"
  use "vim-airline/vim-airline"
  use 'vim-airline/vim-airline-themes'
  use 'ryanoasis/vim-devicons'
  use 'jpalardy/vim-slime'
  use 'shime/vim-livedown'
  use 'ap/vim-css-color'
  use 'terryma/vim-multiple-cursors'
  use 'mattn/emmet-vim'
  use 'scrooloose/nerdtree'
  use 'mxw/vim-jsx'
-- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    },
    config = function ()
      require('mason.settings').set({
        log_level = vim.log.levels.DEBUG
      })
    end
  }
end)
