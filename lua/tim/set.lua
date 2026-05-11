vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "200"

-- Stop adding comment on next line when creating new line from a comment
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")

vim.api.nvim_exec([[
  augroup FormatOptionsFix
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=o formatoptions-=r
  augroup END
]], false)

vim.g.mapleader = " "

-- Have same clipboard as system
vim.opt.clipboard = "unnamedplus"

-- Highlight when yanking
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 30 })
  end,
})
