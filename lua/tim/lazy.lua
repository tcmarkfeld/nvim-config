local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
        "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            disable_background = true,
            styles = { italic = false },
        },
    },

    "EdenEast/nightfox.nvim",

    -- VS Code dark theme (Dark Modern background, Dark+ syntax colors).
    { "Mofiqul/vscode.nvim", opts = {} },

    {
        "neanias/everforest-nvim",
        main = "everforest",
        opts = {},
    },

    {
        "vague2k/vague.nvim",
        opts = {},
    },

    {
        "rebelot/kanagawa.nvim",
        opts = {
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,   -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {             -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = "wave",    -- Load "wave" theme when 'background' option is not set
            background = {     -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus"
            },
        },
    },

    -- Keymaps live in after/plugin/trouble.lua.
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                follow_current_file = { enabled = true }, -- highlight and expand to the open file, like VS Code
            },
        },
    },

    -- Open buffers as tabs along the top, like VS Code. Cycle with [b / ]b.
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                -- Start the tabs after the explorer instead of above it.
                offsets = { { filetype = "neo-tree", text = "Explorer", highlight = "Directory", separator = true } },
            },
        },
    },

    { "nvim-treesitter/nvim-treesitter", branch = "main", lazy = false, build = ":TSUpdate" },
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    { "lewis6991/gitsigns.nvim", opts = {} }, -- keymaps in after/plugin/gitsigns.lua

    -- LSP + completion, configured in after/plugin/lsp.lua
    "neovim/nvim-lspconfig",
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    { "L3MON4D3/LuaSnip", version = "v2.*" },

    { "markwoodhall/vim-nuget", dependencies = { "mattn/webapi-vim" } },
    "junegunn/fzf.vim",
}, {
    rocks = { enabled = false },
})
