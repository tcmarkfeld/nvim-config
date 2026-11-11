local gs = require("gitsigns")

vim.keymap.set("n", "]h", function() gs.nav_hunk("next") end, { desc = "Next git hunk" })
vim.keymap.set("n", "[h", function() gs.nav_hunk("prev") end, { desc = "Previous git hunk" })
vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame line" })
