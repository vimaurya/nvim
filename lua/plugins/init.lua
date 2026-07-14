-- ~/.config/nvim/lua/plugins/init.lua
return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = {},
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "left", -- Fixed: Added missing comma
        width = 35,
        adaptive_size = false,
      }, 
    },
  },

  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    dependencies = {
      "rasulomaroff/telepath.nvim",
    },
    opts = {}
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", 
        "cpp", "yaml"
      },
      highlight = {
        enable = true,
      },
    },
  },

  -- New context tracking plugin added cleanly here:
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      enable = true,
      max_lines = 3, -- Pins up to 3 parent blocks to the top
      line_numbers = true,
    },
  },
}
