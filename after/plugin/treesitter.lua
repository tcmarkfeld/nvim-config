-- nvim-treesitter `main` only installs parsers; Neovim does the highlighting.
require('nvim-treesitter').install({
        'bash', 'c', 'c_sharp', 'ini', 'javascript', 'json', 'lua', 'markdown', 'markdown_inline',
        'properties', 'python', 'query', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
})

vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
                -- pcall: no parser for this filetype means plain highlighting, not an error.
                pcall(vim.treesitter.start, args.buf)
        end,
})
