local M = {}

M.generals = {
  n = {
    ["<leader>qq"] = { ":xa!<CR>", "quit nvim" },
    ["<leader>fs"] = { ":w<CR>", "save file" },
    ["<leader>X"] = {
      function()
        require('custom.plugins.utils').close_all_bugs_except_current()
      end,
      " close buffers except current one",
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
    ["<leader>gc"] = { ":Telescope git_commits<CR>", "  find git commits" },
    ["<leader>bb"] = { ":Telescope buffers<CR>", "  find buffers" },
    ["<leader>gl"] = { ":Telescope git_bcommits<CR>", "  find git branch commits" },
    ["gr"] = { ":Telescope lsp_references<CR>", "  find references" },
    ["<leader>fd"] = {
      function()
        local cwd = require('custom.plugins.directory').current_file_directory()
        if nil == cwd then
          return
        end

        vim.cmd('Telescope find_files no_ignore=true cwd=' .. cwd)
      end,
      "  find files in directory",
    },
    ["<leader>fg"] = {
      function()
        local cwd = require('custom.plugins.directory').current_file_directory()
        if nil == cwd then
          return
        end

        vim.cmd('Telescope live_grep no_ignore=true cwd=' .. cwd)
      end,
      "  find in files in directory",
    },
  },
}

M.tree = {
  n = {
    ["<leader>rf"] = { ":NvimTreeFindFile<CR>", "find file in tree" },
    ["<leader>rc"] = { ":NvimTreeCollapse<CR>", "collaps tree" },
  },
}

return M
