local function toggle_blame()
  local config = {
    excluded_buftypes = {
      "nofile",
    },
  }

  if vim.tbl_contains(config.excluded_buftypes, vim.bo.buftype) then
    return
  end

  if "fugitiveblame" == vim.bo.filetype then
    vim.cmd("Bdelete")
  else
    vim.cmd("Git blame --date=format:'%Y-%m-%d'")
  end
end

return {
  toggle_blame = toggle_blame,
}
