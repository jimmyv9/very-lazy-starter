-- ~/.config/nvim/lua/plugins/lualine.lua

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'rose-pine',
                section_separators = '',
                component_separators = ''
            }
        }
    end,
}

