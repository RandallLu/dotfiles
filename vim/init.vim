call plug#begin('~/.local/share/nvim/site/pack/git-plugins')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ujihisa/neco-look'
Plug 'Shougo/neco-syntax'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()



let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1



set termguicolors
set number
set ignorecase
colorscheme neodark
"let g:neodark#background = '#202020'"


syntax on

nnoremap H gT
nnoremap L gt
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg<Cr>
