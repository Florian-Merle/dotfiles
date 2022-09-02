local M = {}

M.get_target_dir = function()
  local lib = require "nvim-tree.lib"
  local node = lib.get_node_at_cursor()

  if not node then
    return nil
  end

  local cwd = node.cwd or node.link_to or node.absolute_path
  if vim.fn.isdirectory(cwd) ~= 0 == true then
    return cwd
  end

  return node.parent.cwd or node.parent.link_to or node.parent.absolute_path
end

return M;
