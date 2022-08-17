local M = {}

M.generals = {
  n = {
    ["<leader>qq"] = { ":xa!<CR>", "quit nvim" },
    ["<leader>fs"] = { ":w<CR>", "save file" },
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
    ["<leader>gl"] = { ":Telescope git_bcommits<CR>", "  find git branch commits" },
    ["gr"] = { ":Telescope lsp_references<CR>", "  find references" },
    ["<leader>fd"] = {
      function()
        local lib = require "nvim-tree.lib"
        local node = lib.get_node_at_cursor()

        if node then
          local cwd = node.cwd or node.link_to or node.absolute_path
          if vim.fn.isdirectory(cwd) ~= 0 == false then
            cwd = node.parent.cwd or node.parent.link_to or node.parent.absolute_path
          end

          local telescope = require "telescope.builtin"
          telescope.find_files({ cwd=cwd, no_ignore=true })
        end
      end,
      "  find files in directory",
    },
    ["<leader>fg"] = {
      function()
        local lib = require "nvim-tree.lib"
        local node = lib.get_node_at_cursor()

        if node then
          local cwd = node.cwd or node.link_to or node.absolute_path
          if vim.fn.isdirectory(cwd) ~= 0 == false then
            cwd = node.parent.cwd or node.parent.link_to or node.parent.absolute_path
          end

          local telescope = require "telescope.builtin"
          telescope.live_grep({ cwd=cwd, no_ignore=true })
        end
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

