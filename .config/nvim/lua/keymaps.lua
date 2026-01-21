local map = vim.keymap.set

-- Clear search highlight
map("n", "<leader><space>", ":nohlsearch<CR>", { silent = true })

-- Move by visual line
map("n", "j", "gj")
map("n", "k", "gk")

-- File tree toggle (will be configured with plugin)
map("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })
