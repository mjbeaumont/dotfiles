function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if exists('g:vscode')
    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>
    set clipboard=unnamedplus
else
    set relativenumber
    set tabstop=8
    set expandtab
    set shiftwidth=4  
    set autoindent   
    set smartindent 
    set hidden
    set termguicolors
    set background=dark
    set nohlsearch
    set undodir=~/.vim/undodir
    set signcolumn=auto:4
    
    syntax on
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif 

set ignorecase
set smartcase
set timeoutlen=1000 ttimeoutlen=0

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

:lua require "modules/keymaps"
:lua require "modules/plugins"
:lua require "modules/treesitter"
:lua require "modules/github_theme"
:lua require "modules/telescope"
:lua require "modules/bufferline"
:lua require "modules/alpha"
:lua require "modules/projects"
:lua require "modules/lsp"
:lua require "modules/nvim-cmp"
:lua require "modules/nvim-tree"
