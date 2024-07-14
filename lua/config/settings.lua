-- Undotree directory for containerized environment
vim.opt.undodir = "/workspace/.vim-undo"
vim.opt.undofile = true
-- Use the "+" register on Neovim for general clipboard
vim.o.clipboard = "unnamedplus"
-- Select system clipboard depending on Mac/Linux
if vim.fn.has('unix') == 1 then
  vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ['+'] = 'xclip -selection clipboard',
      ['*'] = 'xclip -selection primary',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -o',
      ['*'] = 'xclip -selection primary -o',
    },
    cache_enabled = 0,
  }
end

