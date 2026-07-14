require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "+", ":vertical resize +5<CR>", { desc = "Window: Increase width" })
map("n", "_", ":vertical resize -5<CR>", { desc = "Window: Decrease width" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
