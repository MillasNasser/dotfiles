require("auto-save").setup({
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
})

vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})
