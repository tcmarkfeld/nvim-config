function ColorMyPencils(color)
    color = color or "kanagawa-dragon"
    vim.cmd.colorscheme(color)

    --    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd("highlight clear Italic")
    vim.cmd("highlight LineNr guibg=none")
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none", fg = "#ECBE7B" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#8A8A8A" }) -- Medium gray
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C0A080", bold = true })
    --   vim.cmd("highlight Italic gui=NONE cterm=NONE")
end

ColorMyPencils()
