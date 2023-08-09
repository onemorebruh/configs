local lsp = require([[lsp-zero]])
local cmp = require([[cmp]])
local lspkind = require([[lspkind]])
local signs = {
  Error =[[󰯆]],
  Warn = [[]],
  Hint = [[]],
  Info = [[]]
}
local suggest_signs = {
  Text = [[󰉿]],
  Method = [[󰆧]],
  Function = [[󰊕]],
  Constructor = [[]],
  Field = [[󰜢]],
  Variable = [[󰀫]],
  Class = [[󰠱]],
  Interface = [[]],
  Module = [[]],
  Property = [[󰜢]],
  Unit = [[󰑭]],
  Value = [[󰎠]],
  Enum = [[]],
  Keyword = [[󰌋]],
  Snippet = [[]],
  Color = [[󰏘]],
  File = [[󰈙]],
  Reference = [[󰈇]],
  Folder = [[󰉋]],
  EnumMember = [[]],
  Constant = [[󰏿]],
  Struct = [[󰙅]],
  Event = [[]],
  Operator = [[󰆕]],
  TypeParameter = [[]],
}

lsp.preset([[recommended]])

local servers = {
  [[tsserver]],
  [[pyright]],
  [[clangd]],
  [[cssls]],
  [[html]],
}

lsp.nvim_workspace()

lsp.setup()

for _, lsp in pairs(servers) do
  require([[lspconfig]])[lsp].setup {
    on_attach = on_attach,
    update_in_insert = true,
    flags = {
      debounce_text_changes = 150
    }
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

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = {
    source = [[always]],
    prefixc = [[]],
  },
  severity_sort = true,
  signs = true
})

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    --[''] = cmp.mapping.cancel({select = false}), TODO
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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

