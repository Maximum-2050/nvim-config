-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "python", "h", "hpp" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      -- Enable type hints in the buffer automatically
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
    default_settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy", -- Tells rust-analyzer to use Clippy (Rust's amazing linter)
        },
      },
    },
  },
}

vim.g.autoformat = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
