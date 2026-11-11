vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle left reveal<CR>", { desc = "Toggle file explorer" })

-- Disable sideways trackpad/mouse scrolling in the tree.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "neo-tree",
    callback = function(args)
        for _, key in ipairs({ "<ScrollWheelLeft>", "<ScrollWheelRight>", "<S-ScrollWheelUp>", "<S-ScrollWheelDown>" }) do
            vim.keymap.set({ "n", "v" }, key, "<Nop>", { buffer = args.buf })
        end
    end,
})

-- Sessions (`:restart` saves one) restore the tree as an empty buffer with the same
-- name, which clashes with the real tree (E95). Wipe it; the auto-open brings it back.
vim.api.nvim_create_autocmd("SessionLoadPost", {
    callback = function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_get_name(buf):match("neo%-tree ") and vim.bo[buf].filetype ~= "neo-tree" then
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
    end,
})

-- Open the explorer (without focusing it) the first time a real file is opened.
-- Skip git commit/rebase messages so `git commit` doesn't open a tree.
vim.api.nvim_create_autocmd("BufReadPost", {
    once = true,
    callback = function(args)
        if vim.bo[args.buf].buftype ~= "" or vim.tbl_contains({ "gitcommit", "gitrebase" }, vim.bo[args.buf].filetype) then
            return
        end
        vim.schedule(function() vim.cmd("Neotree show") end)
    end,
})
