require("plugins")
require("keymap")
-- require("lsp_custom_config")

-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end



-------------------- OPTIONS -------------------------------
local indent = 4
vim.cmd 'colorscheme vim-monokai-tasty'
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menu,noinsert')              -- Completion options (for completion-nvim)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap

vim.cmd 'set undofile'
vim.cmd 'set clipboard=unnamedplus'
vim.cmd 'set inccommand=nosplit'
vim.cmd 'set shell=/bin/bash'
vim.cmd 'set cursorcolumn'

vim.cmd 'autocmd BufWritePre *.py :%s/\\s\\+$//e'
vim.cmd 'autocmd BufWritePre *.cpp :%s/\\s\\+$//e'
vim.cmd 'autocmd BufWritePre *.c :%s/\\s\\+$//e'

vim.api.nvim_set_var('formatdef_black_longer', '"black -l 118 -q ".(&textwidth ? "-l".&textwidth : "")." -"')
vim.api.nvim_set_var('formatters_python', {'black_longer'})

-- vim.api.nvim_set_var('completion_chain_complete_list', {['default'] = {{['complete_items'] = {'lsp', 'path'}}, {['mode'] = '<c-p>'}, {['mode'] = '<c-n>'}}})
vim.api.nvim_set_var('gompletion_tabnine_sort_by_details', 1)
