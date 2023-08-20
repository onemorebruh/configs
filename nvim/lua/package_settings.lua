vim.g.user_emmet_mode=[[a]]

require([[mason]]).setup({
  ui = {
    border = [[double]]
  }
})

--TODO confugure and get used to use
require([[cool-substitute]]).setup({
  setup_keybindings = true,
})
