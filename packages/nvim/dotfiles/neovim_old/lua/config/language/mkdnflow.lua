-- https://github.com/jakewvincent/mkdnflow.nvim

local M = {
    requires = {
        "mkdnflow",
    },
}
function M.before() end

function M.load()
    M.mkdnflow.setup({
        modules = {
            bib = false,
            buffers = true,
            conceal = true,
            cursor = true,
            folds = true,
            links = true,
            lists = true,
            maps = true,
            paths = true,
            tables = true
        },
        filetypes = { md = true, rmd = true, markdown = true },
        create_dirs = true,
        perspective = {
            priority = 'first',
            fallback = 'current',
            root_tell = false,
            nvim_wd_heel = true
        },
        wrap = false,
        silent = false,
        links = {
            style = 'markdown',
            name_is_source = false,
            conceal = false,
            implicit_extension = nil,
            transform_implicit = false,
            transform_explicit = function(text)
                text = text:gsub(" ", "-")
                text = text:lower()
                text = os.date('%Y-%m-%d_') .. text
                return (text)
            end
        },
        to_do = {
            symbols = { ' ', '-', 'x' },
            update_parents = true,
            not_started = ' ',
            in_progress = '-',
            complete = 'x'
        },
        tables = {
            trim_whitespace = true,
            format_on_move = true,
            auto_extend_rows = false,
            auto_extend_cols = false
        },
        mappings = {
            -- Using zk-nvim to create links
            MkdnEnter = { { 'n', 'v' }, '<M-CR>' },
            MkdnTab = false,
            MkdnSTab = false,
            MkdnNextLink = { 'n', ']l' },
            MkdnPrevLink = { 'n', '[l' },
            MkdnNextHeading = { 'n', ']]' },
            MkdnPrevHeading = { 'n', '[[' },
            MkdnGoBack = { 'n', '<BS>' },
            MkdnGoForward = { 'n', '<Del>' },
            MkdnFollowLink = false, -- see MkdnEnter
            -- MkdnDestroyLink = { 'n', '<M-CR>' },
            -- MkdnTagSpan = { 'v', '<M-CR>' },
            MkdnMoveSource = { 'n', '<F2>' },
            MkdnYankAnchorLink = { 'n', 'ya' },
            MkdnYankFileAnchorLink = { 'n', 'yfa' },
            MkdnIncreaseHeading = { 'n', '+' },
            MkdnDecreaseHeading = { 'n', '-' },
            MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
            MkdnNewListItem = false,
            MkdnNewListItemBelowInsert = { 'n', 'o' },
            MkdnNewListItemAboveInsert = { 'n', 'O' },
            MkdnExtendList = false,
            MkdnUpdateNumbering = { 'n', '<leader>wN' },
            MkdnTableNextCell = { 'i', '<Tab>' },
            MkdnTablePrevCell = { 'i', '<S-Tab>' },
            MkdnTableNextRow = false,
            MkdnTablePrevRow = { 'i', '<M-CR>' },
            MkdnTableNewRowBelow = { 'n', '<leader>ir' },
            MkdnTableNewRowAbove = { 'n', '<leader>iR' },
            MkdnTableNewColAfter = { 'n', '<leader>ic' },
            MkdnTableNewColBefore = { 'n', '<leader>iC' },
            MkdnFoldSection = { 'n', 'zf' },
            MkdnUnfoldSection = { 'n', 'zF' }
        }
    })
end

function M.after() end

return M
