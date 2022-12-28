local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = {
  "phpactor",
  "psalm",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      attach(client, bufnr)

      if lsp == "phpactor" or lsp == "psalm"  then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", ":lua require('custom.plugins.php-cs-fixer').format()<CR>", {})
      end
    end,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

-- see https://rust-analyzer.github.io/manual.html#nvim-lsp
lspconfig.rust_analyzer.setup{
  on_attach=function(client)
    -- fixme this gives an error
    -- require'completion'.on_attach(client)
  end,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    },
  },
};
