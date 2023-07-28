local lsp = require([[lsp-zero]])
local cmp = require([[cmp]])
local signs = { Error ="", Warn = "", Hint = "", Info = "" }

lsp.preset([[recommended]])

local servers = {
  [[tsserver]],
  [[pyright]],
  [[jdtls]],
  [[rust_analyzer]],
  [[clangd]],
  [[cssls]],
  [[html]],
}

lsp.nvim_workspace()

lsp.setup()

for _, lsp in pairs(servers) do
  require([[lspconfig]])[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end

vim.diagnostic.config({
  virtual_text = {
    source = [[always]],
    prefixc = [[]],
  },
  severity_sort = true,
})

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    --[''] = cmp.mapping.cancel({select = false}),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl})
end

