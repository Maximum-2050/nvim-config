return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {
      -- Keybindings
      keymap = {
        preset = "default",

        -- Navigate completion menu
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        -- Accept completion
        ["<CR>"] = { "accept", "fallback" },

        -- Manually trigger completion
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },

      -- Appearance
      appearance = {
        nerd_font_variant = "mono",
      },

      -- Completion behavior
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },

        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind", "source_name", gap = 1 },
            },
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
          window = {
            border = "rounded",
          },
        },

        ghost_text = {
          enabled = true,
        },
      },

      -- Sources
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },

        providers = {
          lsp = {
            name = "LSP",
            enabled = true,
            score_offset = 100,
          },

          path = {
            name = "Path",
            enabled = true,
          },

          snippets = {
            name = "Snippets",
            enabled = true,
            score_offset = 50,
          },

          buffer = {
            name = "Buffer",
            enabled = true,
            min_keyword_length = 3,
            max_items = 5,
          },
        },
      },

      -- Fuzzy matching
      fuzzy = {
        implementation = "prefer_rust_with_warning",
        sorts = {
          "exact",
          "score",
          "sort_text",
        },
      },

      -- Signature help
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    },
  },
}
