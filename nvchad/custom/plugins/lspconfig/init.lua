local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = {
  "phpactor",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

