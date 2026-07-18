return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function ()
            local ensureInstalled = {
                "c",
                "css",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "latex",
                "markdown",
                "markdown_inline",
                "python",
                "vimdoc",
                "yaml",
            }
            local alreadyInstalled = require("nvim-treesitter.config").get_installed()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(
                    function(parser)
                        return not vim.tbl_contains(alreadyInstalled, parser)
                    end
                )
                :totable()
            require("nvim-treesitter").install(parsersToInstall)
        end
    }
}
