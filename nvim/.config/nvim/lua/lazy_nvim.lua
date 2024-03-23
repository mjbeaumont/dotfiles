local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

-- the above line does not pull from a local table called plugins
-- instead it's pulling from a string called 'plugins'
-- lazy.nvim will interpret this as a folder called plugins
-- under the lua directory
