local function root_directory()
  local cmd = "git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel"
  local toplevel = vim.fn.system(cmd)

  if not toplevel or #toplevel == 0 or toplevel:match("fatal") then
    return vim.fn.getcwd()
  end

  return toplevel:sub(0, -2)
end

return {
  root_dir = root_directory,
}
