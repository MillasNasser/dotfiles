return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        -- Undo hitory
        "https://github.com/mbbill/undotree",
        keys = {
            {"<leader>u", "<cmd>UndotreeToggle <bar> UndotreeFocus<CR>", desc = "Undotree" }
        }
    },
    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "phpactor",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",

        lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
            -- main one
            { "ms-jpq/coq_nvim", branch = "coq" },
            -- 9000+ Snippets
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
            -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
            -- Need to **configure separately**
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
            -- - shell repl
            -- - nvim lua api
            -- - scientific calculator
            -- - comment banner
            -- - etc
        },
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up", -- if you want to start COQ at startup
                -- Your COQ settings here
            }
        end,
        config = function ()
            local remap = vim.api.nvim_set_keymap
            local npairs = require('nvim-autopairs')
            local lspconfig = require("lspconfig")
            local coq = require("coq")

            npairs.setup({ map_bs = false, map_cr = false })

            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({}))
            lspconfig.phpactor.setup(coq.lsp_ensure_capabilities({}))

            _G.MUtils= {}

            MUtils.CR = function()
                if vim.fn.pumvisible() ~= 0 then
                    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
                        return npairs.esc('<c-y>')
                    else
                        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
                    end
                else
                    return npairs.autopairs_cr()
                end
            end
            remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

            MUtils.BS = function()
                if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
                    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
                else
                    return npairs.autopairs_bs()
                end
            end
            remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        end
    }
}
