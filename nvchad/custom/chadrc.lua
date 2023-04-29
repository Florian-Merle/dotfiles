local override = require 'custom.plugins.override'
local mappings = require 'custom.mappings'
local userPlugins = require 'custom.plugins'

local M = {}

local highlights = require("custom.highlights")

M.ui = {
  theme = "catppuccin_latte",
  hl_add = highlights.add,

  -- see https://github.com/NvChad/nvchad.github.io/blob/03b584083b6d30e7a292b6a6e22aa9cd72988ccc/docs/config/theming.md
  changed_themes = {
    catppuccin_latte = {
      base_30 = {
        black2 = "#d9dbdf",
      },
      polish_hl = {
        TelescopeSelection = {
          bg = "#d9dbdf",
        },
      }
    },
  },
}

M.plugins = {
  user = userPlugins,

  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["nvim-tree/nvim-tree.lua"] = override.nvimtree,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
  },
}

M.mappings = mappings

return M
