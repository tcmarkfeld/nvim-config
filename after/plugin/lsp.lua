-- Built-in LSP client: mason installs servers, mason-lspconfig enables them with vim.lsp.enable.
vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('mason').setup({})
require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'omnisharp', 'rust_analyzer', 'jdtls', 'basedpyright', 'ts_ls' },
})

-- Same keymaps lsp-zero's default_keymaps set. K, [d and ]d are Neovim defaults.
vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
                local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
                end
                map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
                map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
                map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
                map('n', 'go', vim.lsp.buf.type_definition, 'Go to type definition')
                map('n', 'gr', vim.lsp.buf.references, 'Go to reference')
                map('n', 'gs', vim.lsp.buf.signature_help, 'Show function signature')
                map('n', 'gl', vim.diagnostic.open_float, 'Show diagnostic')
                map('n', '<F2>', vim.lsp.buf.rename, 'Rename symbol')
                map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, 'Format')
                map({ 'n', 'x' }, '<F4>', vim.lsp.buf.code_action, 'Execute code action')
        end,
})

-- Show the diagnostics for the cursor line in a popup when the cursor rests on it (after 'updatetime').
-- Skipped while another popup (e.g. K hover) is open so it doesn't cover it.
vim.diagnostic.config({ float = { border = 'rounded', source = 'if_many' } })
vim.api.nvim_create_autocmd('CursorHold', {
        callback = function()
                for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                        if vim.api.nvim_win_get_config(win).relative ~= '' then return end
                end
                vim.diagnostic.open_float({ focus = false })
        end,
})

-- Same completion setup lsp-zero v3 applied.
local cmp = require('cmp')
cmp.setup({
        sources = cmp.config.sources(
                { { name = 'nvim_lsp' }, { name = 'path' } },
                { { name = 'buffer' } } -- only when LSP/path have nothing
        ),
        snippet = {
                expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                end,
        },
        mapping = {
                ['<C-y>'] = cmp.mapping.confirm({ select = false }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                ['<C-p>'] = cmp.mapping(function()
                        if cmp.visible() then cmp.select_prev_item({ behavior = 'insert' }) else cmp.complete() end
                end),
                ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then cmp.select_next_item({ behavior = 'insert' }) else cmp.complete() end
                end),
        },
})
