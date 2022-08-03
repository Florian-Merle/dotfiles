local M = {}

M.autosave = function()
  local present, autosave = pcall(require, "auto-save")

  if present then
    autosave.setup()
  end
end

return M
