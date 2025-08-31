vim.keymap.set("n", "<c-a>", "ggVG", { noremap = false, silent = true }) -- Select all
vim.keymap.set("n", "<C-n>", ":enew<CR>") -- Create a new file and replace current buffer
vim.keymap.set('t', '<leader><esc>', [[<C-\><C-n>]], {silent=true})
vim.keymap.set({"n", "v"}, "<leader>q", "<cmd>q<cr>", {silent=true})
vim.keymap.set({"n", "v"}, "<leader>k", function () vim.cmd[[bd!]] end, {silent=true})
vim.keymap.set({"n", "v"}, "<C-M-f>", ":let @+=expand('%:t:r')<CR>", {silent=true}) -- Capturing filename without extension
vim.keymap.set({"n", "v"}, "<leader>hl", ":nohl<CR>", {silent=true}) -- Setting nohlsearch
vim.keymap.set({"n", "v"}, "<leader>tn", ":tabnew<CR>", {silent=true}) -- Setting nohlsearch

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Shortcut to copy and send to clipboard
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")

-- Move through vim windows
vim.keymap.set({"n", "v"}, "<M-h>", "<C-w>h")
vim.keymap.set({"n", "v"}, "<M-j>", "<C-w>j")
vim.keymap.set({"n", "v"}, "<M-k>", "<C-w>k")
vim.keymap.set({"n", "v"}, "<M-l>", "<C-w>l")

-- Resizing vim windows
vim.keymap.set({"n", "v", "x"}, "<M-H>", "<C-w>2<")
vim.keymap.set({"n", "v", "x"}, "<M-J>", "<C-w>2-")
vim.keymap.set({"n", "v", "x"}, "<M-K>", "<C-w>2+")
vim.keymap.set({"n", "v", "x"}, "<M-L>", "<C-w>2>")

-- Creating new window
vim.keymap.set({"n", "v"}, "<leader>s", "<C-w>s")
vim.keymap.set({"n", "v"}, "<leader>v", "<C-w>v")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- Removing commands
