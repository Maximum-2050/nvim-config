-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.functions")

vim.keymap.set("n", "<leader>v", function()
    local fname = vim.api.nvim_buf_get_name(0)
    local root = FIND_PROJECT_ROOT(fname)

    if not root then
        print("Root not found")
        return
    end

    local buildScript = root .. "/CMake.sh"

    if vim.fn.filereadable(buildScript) == 0 then
        print("No buildScript found in root")
        return
    end

    vim.fn.jobstart({ buildScript }, {
        cwd = root,
        detach = true,
    })
end, { desc = "Run build script" })

vim.keymap.set("n", ";", ":", { desc = "Enter command mode" })
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n><C-k>]])
vim.keymap.set("n", "/", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("v", "/", "gc", { remap = true, desc = "Comment line" })
vim.keymap.set("n", "<Leader>ff", "/", { desc = "Search" })

