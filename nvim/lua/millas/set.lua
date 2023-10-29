-- System
vim.opt.updatetime = 50

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabulations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indentation and wrap mode
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

-- Cursor
vim.opt.guicursor = ""
vim.g.mapleader = " "

-- Undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true

-- Colors
vim.opt.termguicolors = true

