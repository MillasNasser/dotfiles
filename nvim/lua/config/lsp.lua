local coq = require 'coq'
vim.lsp.config('*', coq.lsp_ensure_capabilities())
vim.lsp.enable({
    "c",
    "lua",
    -- "phpactor",
})

-- Diagnostics
vim.diagnostic.config({
    -- Use the default configuration
    -- virtual_lines = true

    -- Alternatively, customize specific options
    virtual_lines = {
        -- Only show virtual line diagnostics for the current cursor line
        current_line = true,
    },
})

