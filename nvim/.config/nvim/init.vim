let mapleader="\<Space>"

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'kana/vim-textobj-user'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'asvetliakov/vim-easymotion'
  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-abolish'
  Plug 'othree/xml.vim'
  Plug 'Julian/vim-textobj-variable-segment'
  Plug 'poetic/vim-textobj-javascript'
call plug#end()
" Better Navigation

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

nnoremap H ^
nnoremap L $

vnoremap <Leader>p "_dP

set relativenumber
set clipboard=unnamedplus
