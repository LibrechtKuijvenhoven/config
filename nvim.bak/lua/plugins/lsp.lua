return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- nvim-cmp and its sources for completion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- Buffer words source
      "hrsh7th/cmp-path", -- Path source
      "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
      "L3MON4D3/LuaSnip", -- Snippet engine
      "rafamadriz/friendly-snippets", -- Collection of common snippets
    },
    opts = function()
      local lspconfig = require("lspconfig")
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- List of language servers you want to set up
      local language_servers = {
        "gopls",
        "lua_ls",
        "rust_analyzer",
        -- Add more servers as needed, e.g.:
        -- "tsserver",
        -- "jsonls",
        -- "html",
        -- "cssls",
      }

      local on_attach = function(client, bufnr)
        -- Function to set up common LSP keybindings
        -- Disable auto-formatting by default for specific LSPs if needed.
        -- Some LSPs (like rust-analyzer) do formatting, others like tsserver might
        -- have it enabled by default, which can conflict with formatters like null-ls.
        -- if client.name == "tsserver" then
        --   client.resolved_capabilities.document_formatting = false
        -- end

        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>vd", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vD", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>vl", "<cmd>Trouble diagnostics current_buf<CR>", opts) -- Requires trouble.nvim
        vim.keymap.set("n", "<leader>vfm", function() vim.lsp.buf.format({ async = true }) end, opts)
      end

      -- Loop through the language servers and set them up
      for _, ls_name in ipairs(language_servers) do
        -- Default setup for most servers
        -- For specific server configurations, you'd add an if-else or a dedicated table.
        lspconfig[ls_name].setup({
          on_attach = on_attach,
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          -- You can add more configurations here, e.g., settings for gopls:
          -- settings = {
          --   gopls = {
          --     gofumpt = true,
          --     codelenses = {
          --       gc_details = false,
          --       generate = true,
          --       regenerate_cgo = true,
          --       test = true,
          --       tidy = true,
          --       upgrade_dependency = true,
          --     },
          --     hints = {
          --       assignVariableTypes = true,
          --       compositeLiteralFields = true,
          --       compositeLiteralTypes = true,
          --       constantValues = true,
          --       functionTypeParameters = true,
          --       parameterNames = true,
          --       rangeVariableTypes = true,
          --     },
          --   },
          -- },
        })
      end

      -- Configure nvim-cmp
      cmp.setup({
        snippet = {
          -- REQUIRED - This tells nvim-cmp how to expand snippets
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
          ["<C-e>"] = cmp.mapping.abort(), -- Abort completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
          -- For snippet navigation
          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP client
          { name = "luasnip" }, -- Snippets
          { name = "buffer" }, -- Words from current buffer
          { name = "path" }, -- File system paths
        }),
        -- Optional: Configure the completion window appearance
        completion = {
          -- Set to false if you prefer to trigger completion manually
          -- autocomplete = true,
          -- keyword_length = 2, -- Minimum characters before autocomplete starts
        },
        formatting = {
          format = require("lspkind").cmp_format({
            -- Options:
            -- mode = "symbol_text", -- Show only symbol for kind, and text for label
            -- maxwidth = 50, -- Truncate to 50 chars
            -- ellipsis_char = "...", -- Characters to show for truncated items
            -- show_labelDetails = true, -- If LSP server provides labelDetails, show it
          }),
        },
      })

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Optional: Enable nvim-web-devicons for better icons in completion
      require("nvim-web-devicons").setup({
        -- your devicon config
      })
    end,
  },

  -- Also include nvim-web-devicons if you want icons in completion
  -- It's a dependency for lspkind, but you can define it separately too.
  -- This ensures it's available for other plugins.
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- Load only when needed
  },

  -- LSPKind for fancy icons in nvim-cmp
  {
    "onsails/lspkind.nvim",
    lazy = true,
  },
}
