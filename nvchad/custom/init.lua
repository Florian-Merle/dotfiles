local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- File extension specific tabbing
autocmd("Filetype", {
   pattern = "php",
   callback = function()
      vim.opt_local.expandtab = true
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
   end,
})

autocmd("VimEnter", {
  callback = function()
    require("auto-save")
  end
})

autocmd("VimEnter", {
  callback = function()
    vim.opt.timeoutlen = 100
  end
})

local yank_group = augroup("HighlightYank", {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 120,
    })
  end,
})

vim.opt.relativenumber = true
vim.opt.scrolloff = 15

-- Open dashboard when every buffers are closed
autocmd("User", {
  pattern = "BDeletePost",
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""

    if fallback_on_empty then
      vim.cmd("Dashboard")
    end
  end,
})
