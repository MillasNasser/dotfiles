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
            local mason_lsp = require("mason-lspconfig")

            mason_lsp.setup() -- Starting module

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function (ev)
                    local opts = { buffer = ev.buf, silent = true }

                    -- set keybinds
                    opts.desc = "[LSP] Show LSP references"
                    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                    opts.desc = "[LSP] Go to declaration"
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                    opts.desc = "[LSP] Show LSP definitions"
                    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                    opts.desc = "[LSP] Show LSP implementations"
                    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                    -- opts.desc = "[LSP] Show LSP type definitions"
                    -- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                    opts.desc = "[LSP] See available code actions"
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                    opts.desc = "[LSP] Smart rename"
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                    opts.desc = "[LSP] Show buffer diagnostics"
                    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                    opts.desc = "[LSP] Show line diagnostics"
                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                    opts.desc = "[LSP] Go to previous diagnostic"
                    vim.keymap.set("n", "[d", function ()
                        vim.diagnostic.jump({ count = -1 })
                    end, opts) -- jump to previous diagnostic in buffer

                    opts.desc = "[LSP] Go to next diagnostic"
                    vim.keymap.set("n", "]d", function ()
                        vim.diagnostic.jump({ count = 1 })
                    end, opts) -- jump to next diagnostic in buffer

                    opts.desc = "[LSP] Show documentation for what is under cursor"
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                    opts.desc = "[LSP] Restart LSP"
                    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary                end
                end
            })

            -- Diagnostics
            vim.diagnostic.config({
                -- Alternatively, customize specific options
                virtual_lines = {
                    current_line = true, -- Only show virtual line diagnostics for the current cursor line
                },
            })
        end
    },
}
