local M = {}

M.disabled = {
  t = {
    -- disable default nvterm mappings
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  n = {
    -- disable default nvterm mappings
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  }
}

M.general = {
  n = {
    ["<leader>qq"] = { ":xa!<CR>", "quit nvim" },
    ["<leader>fs"] = { ":w<CR>", "save file" },
    ["<leader>x"] = {
      function()
        vim.cmd("Bdelete")
      end,
      "close buffer",
    },
    ["<leader>X"] = {
      function()
        require('custom.plugins.utils').close_all_bufs_except_current()
      end,
      "close buffers except current one",
    },
    ["<leader>W"] = {
      function()
        require('custom.plugins.utils').close_all_bufs()
      end,
      "close buffers",
    },
    ["<leader>b<TAB>"] = {
      function()
        require("custom.plugins.utils").switch_to_last_buffer()
      end,
      "last buffer",
    },
  }
}

M.windows = {
  n = {
    ["<leader>w%"] = { ":vsp<CR>", "% split window vertically" },
    ["<leader>w\""] = { ":sp<CR>", "\" split window horizontally" },
    ["<leader>wq"] = { "<C-w>q", " close window" },
    ["<leader>wz"] = { ":MaximizerToggle<CR>", "  maximize window" },
    ["<leader>wl"] = { "<C-w>l", " window right" },
    ["<leader>wh"] = { "<C-w>h", " window left" },
    ["<leader>wj"] = { "<C-w>j", " window bottom" },
    ["<leader>wk"] = { "<C-w>k", " window top" },
    ["<A-l>"] = { ":TmuxNavigateRight<CR>", " window right (tmux included)" },
    ["<A-h>"] = { ":TmuxNavigateLeft<CR>", " window left (tmux included)" },
    ["<A-j>"] = { ":TmuxNavigateDown<CR>", " window bottom (tmux included)" },
    ["<A-k>"] = { ":TmuxNavigateUp<CR>", " window top (tmux included)" },
  },

}

M.telescope = {
  n = {
    ["<leader>."] = { ":Telescope live_grep<CR>", "  find in files" },
    ["<leader> "] = { ":Telescope find_files<CR>", "  find files" },
    ["<leader>ff"] = {
      function()
        vim.cmd(string.format(
          "Telescope file_browser hidden=true grouped=true cwd_to_path=true path=%s",
          require("custom.plugins.directory").buffer_dir()
        ))
      end,
      "file browser",
    },
    ["<leader>gc"] = { ":Telescope git_commits<CR>", "  find git commits" },
    ["<leader>bb"] = { ":Telescope buffers<CR>", "  find buffers" },
    ["<leader>gl"] = { ":Telescope git_bcommits<CR>", "  find git branch commits" },
    ["gr"] = { ":Telescope lsp_references<CR>", "  find references" },
  },
}

M.tree = {
  n = {
    ["<leader>rf"] = { ":NvimTreeFindFile<CR>", "find file in tree" },
    ["<leader>rc"] = { ":NvimTreeCollapse<CR>", "collaps tree" },
  },
}

M.phpactor = {
  n = {
    ["<leader>cp"] = {
      function()
        vim.cmd("PhpactorContextMenu")
      end,
      "open phpactor context menu",
    },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = {
      function()
        vim.cmd("Git")
      end,
      "git status",
    },
    ["<leader>gf"] = {
      function()
        vim.cmd("diffget //2")
      end,
      "apply left diff",
    },
    ["<leader>gh"] = {
      function()
        vim.cmd("diffget //3")
      end,
      "apply right diff",
    },
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "stage hunk",
    },
    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "unstage hunk",
    },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "reset hunk",
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "preview hunk",
    },
    ["<leader>g."] = { ":Gvdiffsplit!<CR>", 'three way diff'},
    ["<leader>gb"] = { ":Git blame --date=format:'%Y-%m-%d'<CR>", 'blame'},
  },
}

M.replacer = {
  n = {
    ["<leader>rr"] = {
      function()
        require("replacer").run({
          rename_files = false,
        })
      end,
      "replace in quickfix list",
    },
  },
}

M.nvterm = {
  t = {
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
}

return M
