local override = require 'custom.plugins.override'
local mappings = require 'custom.mappings'
local userPlugins = require 'custom.plugins'

-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "one_light",
}

M.plugins = {
  user = userPlugins,

  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
  }
}

M.mappings = mappings

return M
