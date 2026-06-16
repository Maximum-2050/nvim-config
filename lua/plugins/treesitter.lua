return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
                "rust",
                "bash",
                "json",
                "lua",
                "markdown",
                "python",
                "yaml",
                "c",
                "cpp",
            })

            opts.highlight = {
                enable = true,
            }

            opts.indent = {
                enable = true,
            }
        end,
    },
}

-- return {
--     -- add more treesitter parsers
--     {
--         "nvim-treesitter/nvim-treesitter",
--         opts = {
--             ensure_installed = {
--                 "bash",
--                 -- "html",
--                 -- "javascript",
--                 "json",
--                 "lua",
--                 "markdown",
--                 -- "markdown_inline",
--                 "python",
--                 -- "query",
--                 -- "regex",
--                 -- "tsx",
--                 -- "typescript",
--                 -- "vim",
--                 "yaml",
--                 "c",
--                 "cpp",
--             },
--         },
--         highlight = {
--             enable = true,
--         },
--     },
--
--     -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
--     -- would overwrite `ensure_installed` with the new value.
--     -- If you'd rather extend the default config, use the code below instead:
--     {
--         "nvim-treesitter/nvim-treesitter",
--         opts = function(_, opts)
--             -- add tsx and treesitter
--             vim.list_extend(opts.ensure_installed, {
--                 "tsx",
--                 "typescript",
--                 "clangd",
--             })
--         end,
--     },
-- }
