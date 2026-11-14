vim.cmd("let g:netrw_banner = 0")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.backspace = {"start", "eol", "indent" }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.mouse = "a"
vim.g.editorconfig = true

-- Diagnostic appearance
vim.diagnostic.config({
  virtual_text = {
      spacing = 4,
      prefix = "-"
  },
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Rustaceanvim configuration
vim.g.rustaceanvim = {
  server = {
    -- rust-analyzer settings
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,

          buildScripts = {
            enable = true,
          },
        },

        check = {
          command = "clippy",
        },

        procMacro = {
          enable = true,
        },

        diagnostics = {
          enable = true,
        },
      },
    },

    on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, silent = true }

      -- Rust code actions
      vim.keymap.set("n", "<leader>ra", function()
        vim.cmd.RustLsp("codeAction")
      end, opts)

      -- Run executables
      vim.keymap.set("n", "<leader>rr", function()
        vim.cmd.RustLsp("runnables")
      end, opts)

      -- Run tests
      vim.keymap.set("n", "<leader>rt", function()
        vim.cmd.RustLsp("testables")
      end, opts)

      -- Debug executables
      vim.keymap.set("n", "<leader>rd", function()
        vim.cmd.RustLsp("debuggables")
      end, opts)

      -- Expand macros
      vim.keymap.set("n", "<leader>re", function()
        vim.cmd.RustLsp("expandMacro")
      end, opts)

      -- Hover actions
      vim.keymap.set("n", "<leader>rh", function()
        vim.cmd.RustLsp("hover", "actions")
      end, opts)

      -- Restart rust-analyzer
      vim.keymap.set("n", "<leader>rR", function()
        vim.cmd.RustAnalyzer("restart")
      end, opts)

      -- Enable inlay hints
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
  },
}
