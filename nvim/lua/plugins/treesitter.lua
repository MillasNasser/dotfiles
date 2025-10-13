return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup({
                modules = {},
                sync_install = true,
                ignore_install = {},
                ensure_installed = {
                    "c",
                    "lua",
                    "php",
                    "sql",
                    "vim",
                    "python",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline"
                },
                auto_install = true,
                highlight = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        node_incremental = "v",
                        node_decremental = "V",
                    },
                },
            })
        end
    }
}
