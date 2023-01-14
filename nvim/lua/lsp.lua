local lsp = require([[lsp-zero]])

lsp.preset([[recommended]])

local servers = {
  [[tsserver]],
  [[pyright]],
  [[jdtls]],
  [[rust_analyzer]],
  [[clangd]],
  [[cssls]],
  [[sumneko_lua]],
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
