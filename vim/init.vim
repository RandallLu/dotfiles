" -----------------------------------Testing-----------------------------------
function s:Cursor_Moved()
  let cur_pos = winline()
  if g:last_pos == 0
    set cul
    let g:last_pos = cur_pos
    return endif
  let diff = g:last_pos - cur_pos
  if diff > 1 || diff < -1
    set cul
  else
    set nocul
  endif
  let g:last_pos = cur_pos
endfunction
autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
let g:last_pos = 0




" -----------------------------------Setting-----------------------------------
" General
syntax on
colorscheme neodark 
set termguicolors
set number
set ignorecase
set hidden
set timeoutlen=500
set splitright
set mouse=a " hold option key when you select the text, then simple c-v; or just select the text, hold control key and right click and select copy manuall




" Global variables 
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'



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
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"nnoremap H gT
"nnoremap L gt
nnoremap H :bp<Cr>
nnoremap L :bn<Cr>
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg<Cr>
tnoremap <Esc> <C-\><C-n>




nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:which_key_map =  {}
autocmd! User * call which_key#register('<Space>', 'g:which_key_map')


let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<Cr>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e ~/.vimrc<Cr>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>ff :FZF<Cr>
let g:which_key_map.f.f = 'open files in the current folder'

nnoremap <silent> <leader>fp :GFiles<Cr>
let g:which_key_map.f.p = 'open files in the current project'


let g:which_key_map.s = {'name': '+search'}
nnoremap <silent> <leader>sb :Rg<Cr>
let g:which_key_map.s.b = 'find text in the current buffer'

nnoremap <silent> <leader>sp :Rg<Cr>
let g:which_key_map.s.p = 'find text the current project'


let g:which_key_map.t = {'name': "tag"}
nnoremap <silent> <leader>tt :TagbarToggle<Cr>

let g:which_key_map.t.t = 'Tagbar'

nnoremap <silent> <leader>tn :vsplit<cr>:terminal<cr>
let g:which_key_map.t.n = 'open new terminal'

nnoremap <silent> <leader>tv :vsplit<cr>:terminal<cr>
let g:which_key_map.t.v = 'open new terminal in vertical split'

nnoremap <silent> <leader>ts :split<Cr>:term<Cr>
let g:which_key_map.t.s = 'Open new terminal in horizontal split'





" -----------------------------------Plugins-----------------------------------
call plug#begin('~/.local/share/nvim/site/pack/git-plugins/start')

"General
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
autocmd! User vim-which-key call which#register('<Space>', 'g:which_key_map')
" Plug 'ujihisa/neco-look' " look for english word


" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'


" For golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()

