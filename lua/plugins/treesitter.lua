return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter").setup({})

            require("nvim-treesitter").install({
                "json",
                "javascript",
                "typescript",
                "yaml",
                "html",
                "css",
                "python",
                "http",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "dockerfile",
                "gitignore",
                "c",
                "java",
                "rust",
            })

            -- Enable highlighting
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "json",
                    "javascript",
                    "typescript",
                    "yaml",
                    "html",
                    "css",
                    "python",
                    "http",
                    "markdown",
                    "bash",
                    "lua",
                    "dockerfile",
                    "gitignore",
                    "c",
                    "java",
                    "rust",
                },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,

    }
}
