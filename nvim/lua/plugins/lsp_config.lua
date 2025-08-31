return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        lazy=false,
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function ()
            local coq = require 'coq'
            local mason_lsp = require("mason-lspconfig")

            mason_lsp.setup() -- Starting module

            vim.lsp.config('*', coq.lsp_ensure_capabilities())

            -- Diagnostics
            vim.diagnostic.config({
                -- Alternatively, customize specific options
                virtual_lines = {
                    current_line = true, -- Only show virtual line diagnostics for the current cursor line
                },
            })
        end
    }
}
