local M = {}

-- returns the directory of nvim-tree current file
M.current_file_directory = function()
  local lib = require "nvim-tree.lib"
  local node = lib.get_node_at_cursor()

  if node == nil then
    return nil
  end

  local cwd = node.cwd or node.link_to or node.absolute_path
  if vim.fn.isdirectory(cwd) ~= 0 == true then
    return cwd
  end

  return node.parent.cwd or node.parent.link_to or node.parent.absolute_path
end

return M;
