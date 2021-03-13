require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

local M = {}

M.search_dotfiles = function ()
    require("telescope.builtin").find_files({
        prompt_title = "< Nvim config >",
        cwd = "$HOME/.config/nvim/"
    })
end

return M
