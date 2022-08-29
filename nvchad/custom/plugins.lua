return  {
  -- lsp
  ['neovim/nvim-lspconfig'] = {
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.plugins.lspconfig'
    end
  },

  ["christoomey/vim-tmux-navigator"] = {
  },

  ["Pocco81/auto-save.nvim"] = {
    module = "auto-save",
    config = function()
      require("auto-save").setup {
        debounce_delay = 500,
      }
    end,
  },

  ["szw/vim-maximizer"] = {
    cmd = "MaximizerToggle",
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },
}
