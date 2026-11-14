local opts = { noremap = true, silent = true }
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
local MiniFiles = require("mini.files")

-- NOTE: mini.nvim
vim.keymap.set({ "n", "x"}, "xj", function() require("mini.splitjoin").join() end, { desc = "Join arguments" })
vim.keymap.set({ "n", "x"}, "xk", function() require("mini.splitjoin").split() end, { desc = "split arguments" })

vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>ef", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) MiniFiles.reveal_cwd() end, { desc = "Toggle into currently opened file" })

vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>ef", function()
    local MiniFiles = require("mini.files")
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

vim.keymap.set("n", "<leader>z", function() require("mini.trailspace").trim() end, { desc = "Remove Trailspaces" })

-- NOTE: SessionSave
vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })

-- NOTE: Harpoon
vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-i>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- NOTE: Telescope
vim.keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>pWs", function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end, { desc = "Find Connected Words Under cursor" })
vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
vim.keymap.set('n', "<leader> ", builtin.find_files, { desc = "Telescope find files" })

-- NOTE: Todo comments
vim.keymap.set("n", "]t", function()
    todo_comments.jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    todo_comments.jump_prev()
end, { desc = "Previous todo comment" })

-- NOTE: Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- open parent dir in float window
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)

-- NOTE: LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }

vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { })
vim.keymap.set("n", "<leader>k", function() vim.diagnostic.open_float({ scope = "cursor", border = "rounded", source = "if_many", }) end, {})

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

-- Find references
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Code actions / quick fixes
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

end,
})
