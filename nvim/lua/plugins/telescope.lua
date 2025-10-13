return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "folke/todo-comments.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                        }
                    }
                },
            })

            telescope.load_extension("fzf")

            -- set keymaps
            local keymap = vim.keymap -- for conciseness

            keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            keymap.set('n', '<leader>fj', builtin.buffers, { desc = 'Telescope buffers' })
            keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find todos" })
            keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find recent files" })
            keymap.set({"v", "n"}, "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        end
    }
}

