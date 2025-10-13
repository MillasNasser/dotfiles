return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        config = function ()
            require("render-markdown").setup({
                heading = {
                    -- Determines how icons fill the available space.
                    -- | right   | '#'s are concealed and icon is appended to right side                      |
                    -- | inline  | '#'s are concealed and icon is inlined on left side                        |
                    -- | overlay | icon is left padded with spaces and inserted on left hiding additional '#' |
                    position = 'inline',
                    -- Width of the heading background.
                    -- | block | width of the heading text |
                    -- | full  | full width of the window  |
                    -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
                    width = {
                        "full",
                        "full",
                        "full",
                        "block",
                        "block",
                        "block"
                    },
                    -- Amount of margin to add to the left of headings.
                    -- Margin available space is computed after accounting for padding.
                    -- If a float < 1 is provided it is treated as a percentage of available window space.
                    -- Can also be a list of numbers evaluated by `clamp(value, context.level)`.
                    left_margin = 0,
                    -- Amount of padding to add to the left of headings.
                    -- Output is evaluated using the same logic as 'left_margin'.
                    left_pad = {0.5, 0, 0, 0, 0, 0},
                    right_pad = {0, 0, 0, 0.4, 0.2, 0.05},
                    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
                    border = {true, true, false, false, false, false}
                },
                code = {
                    width = 'full',
                    left_margin = 0,
                    left_pad = 0.02,
                    border="thin",

                    language_border = ' ',
                    language_left = '',
                    language_right = '',
                },
            })
        end
    }
}
