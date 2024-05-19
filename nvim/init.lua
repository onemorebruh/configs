--require([[AirlineTheme]])

--	Functions
function Map(mode, lhs, rhs, opts)              --mapping of keys
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function Buffer_not_empty()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

function Checkwidth()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

function SetAlias(from, to)
  vim.cmd([[cnoreabbrev <expr> ]] .. from .. [[ ((getcmdtype() is#':' && getcmdline() is# ']] .. from .. [[')?(']] .. to .. [['):(']] .. from .. [['))]])
end


--	Packages
vim.cmd [[packadd packer.nvim]]
require([[packer]]).startup(function(use)
--plugins
  use {
    [[VonHeikemen/lsp-zero.nvim]],
    requires = {
      -- not specified
      {[[wbthomason/packer.nvim]]},           --package manager
      {[[ryanoasis/vim-devicons]]},           --adds icons support
      {[[jpalardy/vim-slime]]},               --allows to run interpreter from nvim
      {[[shime/vim-livedown]]},               --realtime markdown
      {[[ap/vim-css-color]]},                 --enables hex colors in nvim
      {[[mattn/emmet-vim]]},                  --adds emmet like in vscode
      {[[onsails/lspkind.nvim]]},             --prettifies sugguestions
      {[[nvim-tree/nvim-web-devicons]]},      --option for dashboard-nvim
      {[[vim-airline/vim-airline]]},          --information bar
      -- LSP Support
      {[[neovim/nvim-lspconfig]]},
      {[[williamboman/mason.nvim]]},
      {[[williamboman/mason-lspconfig.nvim]]},

      -- Autocompletion
      {[[hrsh7th/nvim-cmp]]},
      {[[hrsh7th/cmp-buffer]]},
      {[[hrsh7th/cmp-path]]},
      {[[saadparwaiz1/cmp_luasnip]]},
      {[[hrsh7th/cmp-nvim-lsp]]},
      {[[hrsh7th/cmp-nvim-lua]]},

      -- Snippets
      {[[L3MON4D3/LuaSnip]]},
      {[[rafamadriz/friendly-snippets]]},
        log_level = vim.log.levels.DEBUG
      }
    }
    end)


--	Theme
vim.cmd([[set termguicolors]])

vim.cmd([[colorscheme cyberpunk]])


--	Lsp
local lsp = require([[lsp-zero]])
local cmp = require([[cmp]])
local lspkind = require([[lspkind]])

--signs
local signs = {
  Error =[[󰯆]],
  Warn = [[]],
  Hint = [[]],
  Info = [[]]
}

--config
lsp.preset([[recommended]])

local servers = { -- now it is generaly used for setting up lsp servers but it will be used for checking if lsp servers are installed in the future
  [[tsserver]],
  [[pyright]],
  [[clangd]],
  [[cssls]],
  [[html]],
  [[grammarly]],
  [[bashls]],
}

lsp.nvim_workspace()

lsp.setup()

for _, server in pairs(servers) do
  require([[lspconfig]])[server].setup {
    on_attach = on_attach,
    update_in_insert = true,
    flags = {
      debounce_text_changes = 150
    },
  }
end

require([[lspconfig]]).rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  },
  on_attach = on_attach,
  update_in_insert = true,
  flags = {
    debounce_text_changes = 150
  }
}
-- possible border border = {"/", "/", "/", "/", "/", "/", "/", "/"},
--sets signs virtual text (for error description) and updates in insert mode
vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = {
    source = [[always]],
    prefixc = [[]],
  },
  severity_sort = true,
  signs = true,
})

-- setups cmp and it's mappings
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true }),
    ['<C-q>'] = cmp.mapping.abort(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = [[symbol]],
      maxwidth = 50,
      ellipsis_chae = [[...]]
    })
  }
})

for type, icon in pairs(signs) do
  local hl = [[DiagnosticSign]] .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl})
end


--	Configuration
vim.opt.tabstop = 2                                   --sets one tab as 2 spaces
vim.cmd([[set number]])                               --sets numbers in the left side
vim.cmd([[set noswapfile]])                           --disables swap
vim.cmd([[set mouse=a]])                              --enables mouse
vim.opt.shiftwidth = 2                                --more about tabs
vim.opt.softtabstop = 2                               --more about tabs
vim.opt.expandtab = true                              --more about tabs

--airline settings 


vim.g.airline_left_sep = [[]]
vim.g.airline_right_sep = [[]]
vim.g.airline_powerline_fonts = 1
vim.g.airline = 0
vim.g.airline_detect_flag = 1
vim.g.airline_skip_empty_sections = 0
vim.g.airline_section_a = [[]]
vim.g.airline_section_b = [[]]
vim.g.airline_section_c = [[%filename]]
vim.g.airline_section_x = [[]]
vim.g.airline_section_y = [[]]
vim.g.airline_section_z = [[%l:%c]]
vim.g.airline_section_error = [[]]
vim.g.airline_section_warning = [[]]
vim.g.Powerline_symobls=[[unicode]]
vim.cmd([[set guioptions=0]])
vim.cmd([[set showtabline=1]])
vim.g.slime_target = [[tmux]]
vim.g.slime_target = [[neovim]]


vim.cmd([[set colorcolumn=109]])                      --makes line (this one) -->

vim.g.netrw_banner = 0                                --disables netrw banner
vim.g.netrw_liststyle = 3                             --sets netrw as a tree
vim.g.netrw_browse_split = 3                          --sets netrw horizontal split


--open previous tabs if can
vim.cmd([[
augroup open-tabs
    au!
    au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
augroup end
]])


vim.g.user_emmet_mode=[[a]]

--	Bindings
Map([[n]], [[<S-z>]], [[:u<CR>]])                     --undo in shift + z


--	Aliases

SetAlias([[Q]], [[q!]])
SetAlias([[Wq]], [[wq!]])
SetAlias([[QQ]], [[qa!]])
