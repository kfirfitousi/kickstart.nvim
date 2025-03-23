return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {

        keymaps = {
          ['<C-s>'] = false,
          ['|'] = { 'actions.select', opts = { vertical = true } },
        },
        float = {
          max_height = 0.5,
          max_width = 0.5,
          border = 'rounded',
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, bufnr)
            return name == '.DS_Store'
          end,
        },
      }

      vim.keymap.set('n', '\\', function()
        if vim.bo.filetype == 'oil' then
          require('oil.actions').close.callback()
        else
          vim.cmd 'Oil --float'
        end
      end, { desc = 'Toggle Oil or return to last buffer' })
    end,
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
