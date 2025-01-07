-- For nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  -- Optional: Add custom configurations
  view = {
      width = 30, -- Width of the tree
      side = 'left', -- Side of the window (can be 'right')
  },
  renderer = { 
      icons = {   
        show = {
          git = true,   
          folder = true,
          file = true,
          folder_arrow = true,
       },
      },
    },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
