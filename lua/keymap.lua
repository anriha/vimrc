vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '//', ':noh<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>cc', [[<cmd>lua require('telescope_config').search_dotfiles()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>', [[<cmd>lua require('telescope').extensions.frecency.frecency()<cr>]], { noremap = true , silent = true })

vim.api.nvim_set_keymap('n', '<c-k>', ':wincmd k<CR>', { silent = true, noremap = false })
vim.api.nvim_set_keymap('n', '<c-j>', ':wincmd j<CR>', { silent = true, noremap = false })
vim.api.nvim_set_keymap('n', '<c-h>', ':wincmd h<CR>', { silent = true, noremap = false })
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', { silent = true, noremap = false })

vim.api.nvim_set_keymap('n', '<leader>m', ':MaximerToggle!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gs', ':Gedit :<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>af', ':Autoformat<CR>', { silent = true , noremap = true })
