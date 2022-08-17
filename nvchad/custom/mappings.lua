local M = {}

M.generals = {
  n = {
    ["<leader>qq"] = { ":xa!<CR>", "quit nvim" },
    ["<leader>fs"] = { ":w<CR>", "save file" },
  }
}

M.windows = {
  n = {
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

return M

