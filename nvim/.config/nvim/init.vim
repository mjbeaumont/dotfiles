function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

let mapleader="\<Space>"

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'kana/vim-textobj-user'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
  Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as' : 'vsc-easymotion'})
  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-abolish'
  Plug 'othree/xml.vim'
  Plug 'wellle/targets.vim'
call plug#end()
" Better Navigation

if exists('g:vscode')
    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>
    set clipboard=unnamedplus
else
    nnoremap <C-n> :call NumberToggle()<CR>
    set relativenumber
    set tabstop=8
    set expandtab
    set shiftwidth=4  
    set autoindent   
    set smartindent 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif 

nmap s <Plug>(easymotion-s2)

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

nnoremap H ^
nnoremap L $

vnoremap <Leader>p "_dP

