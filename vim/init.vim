
" -----------------------------------Setting-----------------------------------
" General
syntax on
colorscheme neodark
set termguicolors
set number
set ignorecase
set hidden
set timeoutlen=500


" Global variables 
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1


" Golang highlight enable settings
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


"let g:neodark#background = '#202020'"


" Leader
let mapleader="\<space>"


" ----------------------------------Keybindings--------------------------------
"nnoremap H gT
"nnoremap L gt
nnoremap H :bp<Cr>
nnoremap L :bn<Cr>
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg<Cr>




nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


let g:which_key_map =  {}
let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }




" -----------------------------------Plugins-----------------------------------
call plug#begin('~/.local/share/nvim/site/pack/git-plugins/start')

"General
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neco-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
autocmd! User vim-which-key call which#register('<Space>', 'g:which_key_map')
" Plug 'ujihisa/neco-look' " look for english word


" Themes
Plug 'KeitaNakamura/neodark.vim'


" For golang
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()

