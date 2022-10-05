local M = {}

M.get_buffers = function (ignore_current_buffer, sort_mru)
  local buffers = vim.tbl_filter(
    function (b)
      if 1 ~= vim.fn.buflisted(b) then
        return false
      end

      if (ignore_current_buffer or false) and b == vim.api.nvim_get_current_buf() then
        return false
      end

      return true
    end,
    vim.api.nvim_list_bufs() or {}
  )

  if not next(buffers) then
    return {}
  end

  if (sort_mru or false) then
    table.sort(buffers, function(a, b)
      return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
    end)
  end

  return buffers
end

M.close_all_bufs= function()
  local bufdelete = require('bufdelete')

  for _, buf in ipairs(M.get_buffers()) do
    bufdelete.bufdelete(buf)
  end
end

M.close_all_bufs_except_current = function()
  local bufdelete = require('bufdelete')

  for _, buf in ipairs(M.get_buffers{ignore_current_buffer=true}) do
    bufdelete.bufdelete(buf)
  end
end

return M
