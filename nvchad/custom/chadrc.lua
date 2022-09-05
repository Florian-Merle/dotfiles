local override = require 'custom.plugins.override'
local mappings = require 'custom.mappings'
local userPlugins = require 'custom.plugins'

local M = {}

M.ui = {
  theme = "one_light",
}

M.plugins = {
  user = userPlugins,

  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
  },
}

M.mappings = mappings

return M
