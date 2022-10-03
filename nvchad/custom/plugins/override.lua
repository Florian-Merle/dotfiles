local M = {}

M.treesitter = {
  ensure_installed = {
    "php",
    "html",
    "twig",
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
  view = {
    mappings = {
      list = {
        {
          key = "fd",
          action = "find_files",
          action_cb = function ()
            local cwd = require('custom.plugins.nvimtree.actions').get_target_dir()
            if nil == cwd then
              return
            end

            vim.cmd('Telescope find_files no_ignore=true cwd=' .. cwd)
          end,
        },
        {
          key = "fg",
          action = "live_grep",
          action_cb = function ()
            local cwd = require('custom.plugins.nvimtree.actions').get_target_dir()
            if nil == cwd then
              return
            end

            vim.cmd('Telescope live_grep no_ignore=true cwd=' .. cwd)
          end,
        },
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
