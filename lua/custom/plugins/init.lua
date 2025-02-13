vim.keymap.set({ 'n', 'v', 'o' }, 'H', '^', { noremap = true, silent = true, desc = 'Jump to beginning of line' })
vim.keymap.set({ 'n', 'v', 'o' }, 'L', '$', { noremap = true, silent = true, desc = 'Jump to end of line' })

-- center schizzle
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'Scroll down half page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Scroll up half page' })

return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_filetypes = {
        ['gitcommit'] = true,
      }
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    config = function()
      vim.keymap.set('n', '<leader>o', ':Oil<CR>', { desc = '[O]il' })
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      require('oil').setup {
        icons = require('mini.icons').icons,
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
        },
      }
    end,
  },

  {
    'folke/snacks.nvim',
    opts = {
      animate = {},
      zen = {},
      scroll = {},
      indent = {},
      terminal = {},
    },
    config = function()
      vim.keymap.set('n', '<leader>t', ':lua Snacks.terminal()<CR>', { desc = '[T]erminal' })
      vim.keymap.set('n', '<leader>z', ':lua Snacks.zen()<CR>', { desc = '[Z]en' })

      Snacks.dim.disable()
    end,
  },

  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = '[G]it [S]tatus' })

      vim.keymap.set('n', '<leader>ga', ':Git add %<CR>', { desc = '[G]it [A]dd file' })
      vim.keymap.set('n', '<leader>gu', ':Git reset %<CR>', { desc = '[G]it [U]nstage file' })
      vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = '[G]it [P]ush' })
      vim.keymap.set('n', '<leader>gP', ':Git pull<CR>', { desc = '[G]it [P]ull' })

      vim.keymap.set('n', '<leader>gss', ':Git stash<CR>', { desc = '[G]it [S]tash' })
      vim.keymap.set('n', '<leader>gsp', ':Git stash pop<CR>', { desc = '[G]it stash [P]op' })

      vim.keymap.set('n', '<leader>gr', ':Git rebase -i<CR>', { desc = '[G]it [R]ebase interactive' })
      vim.keymap.set('n', '<leader>gbc', ':Git checkout -b ', { desc = '[G]it [B]ranch [C]reate' })
      vim.keymap.set('n', '<leader>gbo', ':Git checkout ', { desc = '[G]it [B]ranch [O]pen (checkout)' })

      vim.keymap.set('n', '<leader>gi', ':Git blame<CR>', { desc = '[G]it [I]diot' })
      vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { desc = '[G]it [L]og' })
      vim.keymap.set('n', '<leader>gh', ':0Gclog<CR>', { desc = '[G]it [H]istory' })
      vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>', { desc = '[G]it [D]iff' })
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-j>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-k>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-l>', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
}
