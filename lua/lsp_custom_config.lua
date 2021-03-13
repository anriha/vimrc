local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', '<leader>jd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>jr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>rs', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_set_keymap("n", "<leader>af", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = false, silent = true })
    elseif client.resolved_capabilities.document_range_formatting then
        vim.api.nvim_set_keymap("n", "<leader>af", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { noremap = false, silent = true })
    end

end

local sumneko_root_path = '/home/anriha/build/lua-language-server/'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

nvim_lsp["pyls_ms"].setup { on_attach = on_attach, cmd = {"dotnet", "exec", "/home/anriha/build/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll"},
                            settings = { python = { autocomplete = { extraPaths = {"/usr/lib/python3.8/site-packages/cv2/python-3.8"} }}}}
nvim_lsp["sumneko_lua"].setup { on_attach = on_attach, cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

nvim_lsp["bashls"].setup { on_attach = on_attach }
nvim_lsp["vimls"].setup { on_attach = on_attach }
nvim_lsp["dockerls"].setup { on_attach = on_attach }
nvim_lsp["vuels"].setup { on_attach = on_attach }
nvim_lsp["tsserver"].setup { on_attach = on_attach , root_dir = util.root_pattern("package.json", "tsconfig.json", ".git") or vim.loop.cwd(); }
-- nvim_lsp["rome"].setup { on_attach = on_attach }
-- nvim_lsp["pyright"].setup { on_attach = on_attach }

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
    omni = true;
  };
}

