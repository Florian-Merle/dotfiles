return  {
  -- lsp
  ['neovim/nvim-lspconfig'] = {
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.plugins.lspconfig'
    end
  },

  ["j-hui/fidget.nvim"] = {
    config = function()
      require("fidget").setup{}
    end
  },

  ["christoomey/vim-tmux-navigator"] = {
  },

  -- use fork of Pocco81/auto-save.nvim, because it solves an issue with buffer id that is invalid
  -- see https://github.com/Pocco81/auto-save.nvim/issues/46#issuecomment-1211868586
  ["nvim-zh/auto-save.nvim"] = {
    module = "auto-save",
    config = function()
      require("auto-save").setup {
        debounce_delay = 500,
      }
    end,
  },

  ["szw/vim-maximizer"] = {
    cmd = "MaximizerToggle",
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    module = "telescope",
    run = "make",
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
  },

  -- ["~/.local/share/phpactor"] = {
  ["phpactor/phpactor"] = {
    run = "composer install --no-dev -o",
  },

  ["tpope/vim-fugitive"] = {
  },

  ["gabrielpoca/replacer.nvim"] = {
  },

  ["petertriho/nvim-scrollbar"] = {
    config = function()
      require("scrollbar").setup({
        handle = {
          color = '#A6A6A6',
          hide_if_all_visible = true,
        },
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
          "fugitiveblame",
          "dashboard",
        },
      })
    end,
  },

  ["glepnir/dashboard-nvim"] = {
    config = function ()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
            --  Sadly no padding option is available atm, so we have to use empty lines
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",

            -- Taken here
            -- https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua#L21
            [[                                                                       ]],
            [[  ██████   █████                   █████   █████  ███                  ]],
            [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
            [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
            [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
            [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
            [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
            [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
            [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
            [[                                                                       ]],

            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
          },

          center = {
            {
              icon ="  ",
              key = "<leader> ",
              desc = "find files            ",
              action = "Telescope find_files",
            },
            {
              icon ="פּ  ",
              key = "<leader>ff",
              desc = "open file browser     ",
              action = "Telescope file_browser hidden=true grouped=true",
            },
            {
              icon ="  ",
              key = "<leader>.",
              desc = "find in files         ",
              action = "Telescope live_grep",
            },
            {
              icon ="  ",
              key = "<leader>qq",
              desc = "quit                  ",
              action = "xa!",
            },
          },

          footer = {
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",

            '🚀 ' .. require("custom.plugins.directory").root_dir()
          }
        }
      }
    end
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function()
      require("indent_blankline").setup {
        filetype_exclude = {
          "help",
          "terminal",
          "alpha",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "dashboard",
          "",
        },
      }
    end
  },

  ["famiu/bufdelete.nvim"] = {
  },

  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  ["tpope/vim-abolish"] = {
    cmd = {"S", "Subvert"},
  },

  ["tpope/vim-surround"] = {
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
  },

  ["FooSoft/vim-argwrap"] = {
  },

  ["simrat39/rust-tools.nvim"] = {
  },
}
