-- init.lua
vim.deprecate = function() end

-- base46 cache (for NvChad themes)
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

-- Leader key
vim.g.mapleader = " "

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins with Lazy.nvim
require("lazy").setup({
  -- NvChad core
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  -- Diffview.nvim for Git diffs
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- You can add more plugins here
  { import = "plugins.init" },
})

-- Load NvChad theme/cache
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load general options and autocmds
require("options")
require("autocmds")

-- Load key mappings
vim.schedule(function()
  require("mappings")
end)

require("configs.nvimtree_resize").setup()

-- Optional: keybinding for Diffview
vim.api.nvim_set_keymap("n", "<leader>dv", ":DiffviewOpen<CR>", { noremap = true, silent = true })

-- Permanent Shortcut: Jump to the immediate parent block based on YAML/C++ indentation
vim.keymap.set('n', '<leader>p', function()
  local current_indent = vim.fn.indent('.')
  if current_indent == 0 then
    print("Already at root")
    return
  end
  
  -- Calculate parent indentation boundary
  local parent_indent = math.max(0, current_indent - 1)
  
  -- Drop a native jump mark so Ctrl+O brings you back down instantly
  vim.cmd('normal! m`🏼') 
  
  -- Search backward for the first line with less indentation
  vim.fn.search('^\\s\\{0,' .. parent_indent .. '}\\S', 'bW')
  vim.cmd('normal! zz') -- Center viewport on the parent header
end, { desc = "Jump to immediate parent block" })
