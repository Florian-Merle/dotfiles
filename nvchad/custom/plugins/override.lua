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
      mappings = {
        i = {
          ["<C-x>"] = require("custom.plugins.telescope.actions").delete_buffer
        },
        n = {
          ["<C-x>"] = require("custom.plugins.telescope.actions").delete_buffer
        },
      },
    },
  },

  extensions = {
    file_browser = {
      hijack_netrw = true,

      mappings = {
        n = {
          ["."] = require("custom.plugins.telescope.actions").live_grep,
        },
      },
    },
  },

  extensions_list = {
    "themes",
    "terms",
    "fzf",
    "file_browser",
  },
}

return M
