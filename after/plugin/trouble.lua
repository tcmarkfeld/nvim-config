vim.keymap.set("n", "<leader>tt", function()
    require("trouble").toggle("diagnostics")
end, { desc = "Toggle Trouble Diagnostics" })

vim.keymap.set("n", "]t", function()
    require("trouble").next({ skip_groups = true, jump = true })
end, { desc = "Next Trouble Item" })

vim.keymap.set("n", "[t", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end, { desc = "Previous Trouble Item" })
