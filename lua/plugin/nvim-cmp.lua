-- Auto-completion / Snippets
return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {"rafamadriz/friendly-snippets"},
    },
    config = function()
      local cmp = require'cmp'
      local select_opts = {behavior = cmp.SelectBehavior.Select}
      local luasnip = require('luasnip')
      require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup({})


      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert({
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
          ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, {'i', 's'}),
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {'i', 's'}),
          --    ['<Tab>'] = cmp.mapping(function(fallback)
          --      local col = vim.fn.col('.') - 1
          --
          --      if cmp.visible() then
          --        cmp.select_next_item(select_opts)
          --      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          --        fallback()
          --      else
          --        cmp.complete()
          --      end
          --    end, {'i', 's'}),
          --    ['<S-Tab>'] = cmp.mapping(function(fallback)
          --      if cmp.visible() then
          --        cmp.select_prev_item(select_opts)
          --      else
          --        fallback()
          --      end
          --    end, {'i', 's'}),
        }),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "copilot" },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help'},
          { name = 'luasnip', keyword_length = 1 }, -- For luasnip users.
          { name = 'buffer',
          option = {
            get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
          }
        },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
        { name = 'buffer-lines' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })


    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
      })
    end

    sign({name = 'DiagnosticSignError', text = '✘'})
    sign({name = 'DiagnosticSignWarn', text = '▲'})
    sign({name = 'DiagnosticSignHint', text = '⚑'})
    sign({name = 'DiagnosticSignInfo', text = '»'})

    vim.diagnostic.config({
      focus = true,
      virtual_text = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
      },
    })

    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open Diagnostic Float' })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
    )

  end,
  }



