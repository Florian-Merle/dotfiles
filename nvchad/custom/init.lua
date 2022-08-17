local autocmd = vim.api.nvim_create_autocmd

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
