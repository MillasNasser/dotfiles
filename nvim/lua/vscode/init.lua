local vscode = require("vscode-neovim")

vim.keymap.set("v", "<C-d>", function()
    vscode.VSCodeNotifyRangePos(
        'editor.action.addSelectionToNextFindMatch',
        vim.fn.line("v"),
        vim.fn.line("."),
        vim.fn.col("v"),
        vim.fn.col(".")
    )
end)
