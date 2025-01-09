vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("PackerSync")
    end,
})


return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    ----------------------
    -- Required plugins --
    ----------------------

    use('nvim-lua/plenary.nvim')

    -- nvim-treesitter and related plugins
    use({
        'nvim-treesitter/nvim-treesitter',
        event = 'CursorHold',
        run = ':TSUpdate',
        config = function()
            -- Add your configuration for treesitter here, if any
        end,
    })

    use({
      'nvim-tree/nvim-tree.lua',
      config = function()
        require('nvim_tree_config')
      end,
    })

    use({
      'neovim/nvim-lspconfig',
      config = function()
        local nvim_lsp = require('lspconfig')

        -- Configure Pyright for Python
        nvim_lsp.pyright.setup{}
      end,
    })


    use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })
    use({ 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' })
    use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' })

end)

