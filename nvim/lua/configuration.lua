vim.opt.tabstop = 2
vim.cmd([[colorscheme dedsec]])
vim.cmd([[set number]])
vim.cmd([[set noswapfile]])
vim.cmd([[set mouse=a]])
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.cmd([[set mouse=a]])

vim.g.airline_powerline_fonts = 1
vim.g.airline = 0
vim.g.airline_section_z = [[Row:%l Col:%c]]
vim.g.Powerline_symobls=[[unicode]]
vim.cmd([[set guioptions=0]])
vim.cmd([[set showtabline=1]])
vim.g.slime_target = [[tmux]]
vim.g.slime_target = [[neovim]]

vim.cmd([[set colorcolumn=109]])


function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 3

map([[n]], [[<C-Left>]], [[:tabprevious<CR>]])                                                                            
map([[n]], [[<C-Right>]], [[:tabnext<CR>]])
map([[n]], [[<C-Up>]], [[:tabnew .<CR>]])

vim.cmd([[
augroup open-tabs
    au!
    au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
augroup end
]])

