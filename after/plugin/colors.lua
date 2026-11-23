function ColorMyPencils(color)
    color = color or "vscode"
    vim.cmd.colorscheme(color)

    --    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd("highlight clear Italic")
    vim.cmd("highlight LineNr guibg=none")
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "none", fg = "#ECBE7B" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#8A8A8A" }) -- Medium gray
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD700", bold = true }) -- gold

    -- Set the explorer apart from code like VS Code Dark Modern: darker sidebar and a visible divider.
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3c3c3c" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#3c3c3c", bg = "#181818" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#181818" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#181818" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "#181818", bg = "#181818" })
    --   vim.cmd("highlight Italic gui=NONE cterm=NONE")
end

ColorMyPencils()
