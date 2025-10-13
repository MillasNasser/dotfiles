vim.keymap.set("n", "<leader>a", "ggVG", {noremap = false, silent = true , desc="Select all"})
vim.keymap.set("n", "<C-n>", ":enew<CR>", {silent=true, desc="Create a new file and replace current buffer"})
vim.keymap.set('t', '<leader><esc>', [[<C-\><C-n>]], {silent=true, desc="Normal Mode in terminal"})
vim.keymap.set({"n", "v"}, "<leader>q", "<cmd>q<cr>", {silent=true, desc="Close buffer"})
vim.keymap.set({"n", "v"}, "<leader>k", function () vim.cmd[[bd!]] end, {silent=true, desc="Close and delete buffer"})
vim.keymap.set({"n", "v"}, "<C-M-f>", ":let @+=expand('%:t:r')<CR>", {silent=false, desc="Capturing filename without extension"})
vim.keymap.set({"n", "v"}, "<leader>hl", ":nohl<CR>", {silent=true, desc="Setting nohlsearch"})
vim.keymap.set({"n", "v"}, "<leader>tn", ":tabnew<CR>", {silent=true, desc="Setting nohlsearch"})
vim.keymap.set({"n", "v"}, "<leader>oo", ":!open %<CR>", {silent=true, desc="Open file in xdgopen"})

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

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- Adding nj and nk to jumplist
vim.keymap.set({ "n", "x" }, "j", function()
  -- Check if a numerical count (v:count) is provided, and if it's greater than 1.
  -- v:count1 is similar but defaults to 1 if no count is provided.
  if vim.v.count > 1 then
    -- If a count is present, set the previous context mark (m')
    -- and then append the count and the 'j' motion.
    return "m'" .. vim.v.count .. "j"
  else
    -- If no count (or count of 1) is present, simply perform the 'j' motion.
    return "j"
  end
end, { noremap = true, expr = true, desc = "Add to jumplist on counted 'j' movement" })

vim.keymap.set({ "n", "x" }, "k", function()
  if vim.v.count > 1 then
    return "m'" .. vim.v.count .. "k"
  else
    return "k"
  end
end, { noremap = true, expr = true, desc = "Add to jumplist on counted 'k' movement" })

-- Removing commands
