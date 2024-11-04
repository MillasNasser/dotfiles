vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open explorer
vim.keymap.set("n", "<leader>a", "ggVG") -- Select all
vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste without change buffer
vim.keymap.set("n", "<C-n>", ":enew<CR>") -- Create a new file and replace current buffer
vim.keymap.set({"n", "v"}, "<leader>q", function () vim.cmd[[bd!]] end, {silent=true})
-- vim.keymap.set("n", "J", ":let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>")
vim.keymap.set({"n", "v"}, "<C-M-f>", ":let @+=expand('%:t:r')<CR>", {silent=true}) -- Capturing filename without extension
vim.keymap.set({"n", "v"}, "<C-M-e>", ":let @+=expand('%:t')<CR>", {silent=true}) -- Capturing filename with extension
vim.keymap.set({"n", "v"}, "<leader>hl", ":nohl<CR>", {silent=true}) -- Setting nohlsearch
vim.keymap.set({"n", "v"}, "<leader>tn", ":tabnew<CR>", {silent=true}) -- Setting nohlsearch

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centralize the search term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Shortcut to copy and send to clipboard
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

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

-- Creating new window and changing to them
vim.keymap.set({"n", "v"}, "<leader>s", "<C-w>s<C-w>w")
vim.keymap.set({"n", "v"}, "<leader>v", "<C-w>v<C-w>w")

-- Removing commands

-- Personalized Commands
vim.api.nvim_create_user_command("Build", function ()
    os.execute('bear -- make')
end, {})
