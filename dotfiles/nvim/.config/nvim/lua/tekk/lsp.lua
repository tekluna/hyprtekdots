-- Initialize Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "lua_ls", "pyright" },  -- Install JS, Lua, Python
})

-- Setup LSP servers
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- JS/TS
lspconfig.tsserver.setup({
  capabilities = capabilities,
})

-- Lua (optional)
lspconfig.lua_ls.setup({
  capabilities = capabilities,
})

-- Python (optional)
lspconfig.pyright.setup({
  capabilities = capabilities,
})

