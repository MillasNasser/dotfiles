vim.keymap.set({"n", "v"}, "<leader>r", function ()
    vim.cmd([[!make && ./main && make clean]])
end )
