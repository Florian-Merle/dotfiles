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
  update_focused_file = {
    enable = false
  },
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

M.telescope = {
  pickers = {
    buffers = {
      -- sort_mru = true,
      ignore_current_buffer = true,
    },
  },

  extensions_list = {
    "themes",
    "terms",
    "fzf",
  },
}

return M
