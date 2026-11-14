return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")

        todo_comments.setup({
            keywords = {
                FIX = {
                    icon = " ",
                    color = "error",
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                },
                TODO = {
                    icon = " ",
                    color = "info",
                    alt = {"Personal"}
                },
                HACK = {
                    icon = " ",
                    color = "warning",
                    alt = { "DONT SKIP" }
                },
				WARN = {
                    icon = " ",
                    color = "warning",
                    alt = { "WARNING", "XXX" }
                },
				PERF = {
                    icon = " ",
                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }
                },
				NOTE = {
                    icon = " ",
                    color = "hint",
                    alt = { "HINT", "INFO", "READ", "COLORS", "Custom" }
                },
				TEST = {
                    icon = "⏲ ",
                    color = "test",
                    alt = { "TESTING", "PASSED", "FAILED" } },
				FORGETNOT = {
                    icon = " ",
                    color = "hint"
                },
            }
        })

    end
}
