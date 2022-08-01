local M = {}

M.generals = {
  n = {
    ["<leader>qq"] = { ":xa!<CR>", "quit nvim" },
    ["<leader>fs"] = { ":w<CR>", "save file" },
  }
}

M.windows = {
  n = {
    ["<C-l>"] = { "<C-w>l", "todo" },
    ["<C-h>"] = { "<C-w>h", "todo" },
    ["<C-j>"] = { "<C-w>j", "todo" },
    ["<C-k>"] = { "<C-w>k", "todo" },
  },
}

M.telescope = {
  n = {
    ["<leader>."] = { ":Telescope live_grep<CR>", "find in files" },
    ["<leader> "] = { ":Telescope find_files<CR>", "find files" },
  },
}

return M
