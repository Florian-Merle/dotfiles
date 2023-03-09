local override = require 'custom.plugins.override'
local mappings = require 'custom.mappings'
local userPlugins = require 'custom.plugins'

local M = {}

local highlights = require("custom.highlights")

M.ui = {
  theme = "one_light",
  hl_add = highlights.add,
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
