local M = {}

M.treesitter = {
  ensure_installed = {
    "php",
    "html",
    "css",
    "javascript",
    "json",
    "markdown",
    "org",
    "lua",
    "bash",
  },
  indent = {
    enable = true
  },
}

M.nvimtree = {
  -- fixme
  -- update_focus_file = {
  --   enable = false
  -- },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
