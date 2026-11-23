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

-- CursorLineNr only applies with cursorline on; "number" highlights just the number, not the line.
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
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

-- Reload files changed outside Neovim (e.g. by Claude). 'autoread' only acts when
-- something runs :checktime, so check every second. Skipped while typing a command.
vim.uv.new_timer():start(1000, 1000, vim.schedule_wrap(function()
  if vim.fn.mode() ~= "c" and vim.fn.getcmdwintype() == "" then
    vim.cmd("silent! checktime")
  end
end))

-- Highlight when yanking
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})
