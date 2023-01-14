vim.g.user_emmet_mode=[[a]]

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map([[n]], [[<leader>n]], [[:NERDTreeFocus<CR>]])
map([[n]], [[<C-n>]], [[:NERDTree<CR>]])
map([[n]], [[<C-b>]], [[:NERDTreeToggle<CR>]])
map([[n]], [[<C-f>]], [[:NERDTreeFind<CR>]])
