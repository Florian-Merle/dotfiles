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
    "rust",
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- not sure what attribute is for php
        ["aA"] = "@attribute.outer",
        ["iA"] = "@attribute.inner",

        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
        ["im"] = "@call.inner",
        ["am"] = "@call.outer",
        ["ax"] = "@comment.outer",
        ["iC"] = "@conditional.inner",
        ["aC"] = "@conditional.outer",
        ["iL"] = "@loop.inner",
        ["aL"] = "@loop.outer",
        ["aS"] = "@statement.outer",
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = "@class.outer",
        },
      },
      include_surrounding_whitespace = function(opts)
        local qs = opts.query_string

        if     qs == '@function.inner' then return false
        elseif qs == '@class.outer' then return false
        elseif qs == '@call.outer' then return false
        elseif qs == '@comment.outer' then return false
        elseif qs == '@conditional.inner' then return false
        elseif qs == '@conditional.outer' then return false
        elseif qs == '@loop.inner' then return false
        elseif qs == '@loop.outer' then return false
        elseif qs == '@statement.outer' then return false
        end

        return true
      end,
    },
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

M.ui = {
  statusline = {
    separator_style = "round",
  },
}

return M
