-- ~/.config/nvim/lua/configs/nvimtree_resize.lua
local M = {}

function M.setup()
  -- Create an autocommand group for NvimTree
  local augroup = vim.api.nvim_create_augroup("NvimTreeFixWidth", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "VimResized" }, {
    group = augroup,
    pattern = "NvimTree_*",
    callback = function()
      -- Prevent NvimTree from taking up the entire screen when other windows close
      vim.opt_local.winfixwidth = true
      
      -- Optional: Enforce specific width constraints (e.g., 35 columns)
      -- Adjust the number '35' if you prefer a different width
      local width = 35
      if vim.fn.winwidth(0) ~= width then
        vim.cmd("vertical resize " .. width)
      end
    end,
  })
end

return M
