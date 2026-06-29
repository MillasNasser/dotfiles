local function get_visual_lines()
    -- 1. Exit visual mode to update the '< and '> marks
    -- This ensures we grab exactly what was highlighted
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 'x', true)

    -- 2. Get selection coordinates (1-indexed from marks)
    local start_pos = vim.api.nvim_buf_get_mark(0, "<")
    local end_pos = vim.api.nvim_buf_get_mark(0, ">")

    local start_row, start_col = start_pos[1] - 1, start_pos[2]
    local end_row, end_col = end_pos[1] - 1, end_pos[2] + 1

    -- 3. Extract text from the current buffer
    -- We use get_text to handle partial line selections (block/characterwise)
    local lines = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})

    return lines
end

local function create_floating_window()
    -- Retrieving visual lines if are any
    local lines = {""}
    local mode = vim.api.nvim_get_mode().mode
    if mode == "v" or mode == "V" then
        lines = get_visual_lines()
    end

    -- Create the buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'filetype', vim.bo.filetype)
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe') -- Delete buffer when window closes

    -- 2. Define window dimensions and position
    local width = math.ceil(vim.o.columns * 0.8)
    local height = math.ceil(vim.o.lines * 0.8)
    local row = math.ceil((vim.o.lines - height) / 2 - 1)
    local col = math.ceil((vim.o.columns - width) / 2)

    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        -- style = 'minimal', -- Removes number column, etc.
        border = 'rounded', -- Optional: 'single', 'double', 'shadow'
        title = ' Selection Buffer ',
        title_pos = 'center'
    }

    -- Open the window
    vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    -- TODO: Add apply feature to script when code changed
end

-- Map it to a key
vim.keymap.set({'n', 'v'}, '<leader>fw', create_floating_window, { desc = "Open floating window" })
