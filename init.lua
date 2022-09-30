vim.opt.tabstop = 2
vim.cmd([[colorscheme dedsec]])
vim.cmd([[set number]])
vim.cmd([[set noswapfile]])
vim.cmd([[set mouse=a]])
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

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
    }
  }
end)

vim.cmd([[
  let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=1 "Отключаем панель табов (окошки FTW)
let g:slime_target = "tmux"
let g:slime_target = "neovim"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:user_emmet_mode='a'

set colorcolumn=109
]])

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()

local servers = { 'pyright', 'tsserver', 'jdtls' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
    }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end