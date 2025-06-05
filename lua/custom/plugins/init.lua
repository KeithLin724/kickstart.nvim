-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      image = { enabled = true },
      dashboard = {

        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 2, 2 } },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2 },
          { section = 'startup' },
        },
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      lazygit = { enabled = true },
    },
    keys = {
      {
        '<C-p>',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
      },
      {
        '<leader>g',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Smart Grep',
      },
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<C-f>',
        function()
          Snacks.picker.lines()
        end,
        desc = 'Buffer Lines',
      },
      {
        '<c-/>',
        function()
          Snacks.terminal()
        end,
        desc = 'Toggle Terminal',
      },
    },
  },

  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      extensions = {
        -- to use default settings:
        -- smart_splits = {},
        -- -- default settings shown below:
        smart_splits = {
          directions = { 'h', 'j', 'k', 'l' },
          mods = {
            -- for moving cursor between windows
            move = '<C>',
            -- for resizing windows
            resize = '<M>',
            -- for swapping window buffers
            swap = false, -- false disables creating a binding
          },
        },
      },
    },
    keys = {
      -- 調整窗口大小（resize）
      {
        '<A-h>',
        function()
          require('smart-splits').resize_left()
        end,
        mode = 'n',
        desc = 'Resize left',
      },
      {
        '<A-j>',
        function()
          require('smart-splits').resize_down()
        end,
        mode = 'n',
        desc = 'Resize down',
      },
      {
        '<A-k>',
        function()
          require('smart-splits').resize_up()
        end,
        mode = 'n',
        desc = 'Resize up',
      },
      {
        '<A-l>',
        function()
          require('smart-splits').resize_right()
        end,
        mode = 'n',
        desc = 'Resize right',
      },

      -- 在 splits 間移動游標
      {
        '<C-h>',
        function()
          require('smart-splits').move_cursor_left()
        end,
        mode = 'n',
        desc = 'Move cursor left',
      },
      {
        '<C-j>',
        function()
          require('smart-splits').move_cursor_down()
        end,
        mode = 'n',
        desc = 'Move cursor down',
      },
      {
        '<C-k>',
        function()
          require('smart-splits').move_cursor_up()
        end,
        mode = 'n',
        desc = 'Move cursor up',
      },
      {
        '<C-l>',
        function()
          require('smart-splits').move_cursor_right()
        end,
        mode = 'n',
        desc = 'Move cursor right',
      },
      {
        '<C-\\>',
        function()
          require('smart-splits').move_cursor_previous()
        end,
        mode = 'n',
        desc = 'Move to previous split',
      },

      -- 在窗口間交換 buffer
      {
        '<leader>h',
        function()
          require('smart-splits').swap_buf_left()
        end,
        mode = 'n',
        desc = 'Swap buffer left',
      },
      {
        '<leader>j',
        function()
          require('smart-splits').swap_buf_down()
        end,
        mode = 'n',
        desc = 'Swap buffer down',
      },
      {
        '<leader>k',
        function()
          require('smart-splits').swap_buf_up()
        end,
        mode = 'n',
        desc = 'Swap buffer up',
      },
      {
        '<leader>l',
        function()
          require('smart-splits').swap_buf_right()
        end,
        mode = 'n',
        desc = 'Swap buffer right',
      },
    },
  },
  -- -- about the conda
  -- {
  --   'kmontocam/nvim-conda',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  -- },
  -- about the render markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  { 'github/copilot.vim', opts = {} },
  {
    'xiyaowong/transparent.nvim',
    config = function()
      require('transparent').setup {
        enable = true, -- 預設啟用透明
        extra_groups = {
          'NormalFloat',
          'NvimTreeNormal',
          'TelescopeNormal',
          'TelescopeBorder',
          'TelescopePromptBorder',
          'TelescopeResultsBorder',
          'TelescopePreviewBorder',
        },
        exclude = {}, -- 可在這裡排除不要透明的 group
      }

      vim.cmd 'TransparentEnable' -- 啟用透明功能
    end,
  },
}
