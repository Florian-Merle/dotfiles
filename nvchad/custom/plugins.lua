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

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    module = "telescope",
    run = "make",
  },

  ["phpactor/phpactor"] = {
    run = "composer install --no-dev -o",
  },

  ["tpope/vim-fugitive"] = {
  },

  ["gabrielpoca/replacer.nvim"] = {
  },
}
