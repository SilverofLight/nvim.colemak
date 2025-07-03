return {
  {
    'saghen/blink.cmp',
    cond = not vim.g.vscode,
    lazy = true,
    -- optional: provides snippets for the snippet source
    -- dependencies = 'rafamadriz/friendly-snippets',
    dependencies = {
      'Kaiser-Yang/blink-cmp-avante',
    },

    -- use a release tag to download pre-built binaries
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab',
        ['<C-r>'] = { 'show', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback'
        },
        ['<C-k>'] = { 'select_next', 'fallback' },
      },
      sources = {
        default = { 'avante', 'lsp', 'snippets', 'path', 'buffer', 'codeium' },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = "Avante",
            opts = {
              -- opts for blink-cmp-avante
            }
          },
          codeium = {
            name = 'Codeium',
            module = 'codeium.blink',
            async = true,
            enabled = function()
              return vim.bo.filetype ~= 'markdown'
            end
          }
        }
      },

      appearance = {
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = 'mono'
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          }
        },
        -- list = {
        --   selection = "auto_insert"
        -- },
        menu = {
          draw = {
            treesitter = { "lsp" }
          },
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
          }
        },
        ghost_text = {
          enabled = true
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
    },
  },

  -- auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {}
  },

  -- autocenter
  {
    "LZDQ/nvim-autocenter",
    lazy = true,
    event = "InsertEnter",
    opts = {
      ratio_top = 1 / 3,
      ratio_bot = 2 / 3,
      -- When to call `autozz`. Choose between 'always', 'empty', and 'never'.
      -- 'always' means to always do autozz when buffer text changes.
      -- 'empty'  means to do autozz only when the current line contains whitespaces.
      -- 'never'  means do not autozz. If you choose never, you should enable autopairs.
      when = 'always',
      -- plugin support
      plugins = {
        -- auto center when pressing enter inside specific brackets
        autopairs = {
          enabled = true,
          -- These are rules to auto center when pressing enter after it.
          -- Each item is the lhs of the rule.
          rules_with_cr = {
            "{",
            "'''",
            '"""',
          }
        }
      },
      filetypes = {
        -- Enable or disable filetypes. Use REGEX!!
        -- Wildcard * doesn't work, use .* plz.
        -- disabled rules beats enabled rules when contradicting.
        enabled = { ".*" },
        disabled = { "json" },
      }
    }
  },
  {
    'Aasim-A/scrollEOF.nvim',
    event = { 'CursorMoved', 'WinScrolled' },
    opts = {},
  }

}
