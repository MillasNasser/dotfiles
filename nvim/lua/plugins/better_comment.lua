return {
    {
        "Djancyp/better-comments.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        config = function ()
            require('better-comment').Setup()
        end
    }
}
