local M = {}

M.close_all_bugs_except_current = function()
  local utils = require('core.utils')
  local bufs = utils.bufilter()
  local current_buf = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(bufs) do
    if current_buf ~= buf then
      vim.cmd("bd" .. buf)
    end
  end
end

return M
