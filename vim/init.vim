" -----------------------------------Function-----------------------------------
function s:Cursor_Moved()
  let cur_pos = winline()
  if g:last_pos == 0
    set cul
    let g:last_pos = cur_pos
    return
  endif
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


" Using floating windows of Neovim to start fzf
" if has('nvim')
"   let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

"   function! FloatingFZF()
"     let width = float2nr(&columns * 0.9)
"     let height = float2nr(&lines * 0.6)
"     let opts = { 'relative': 'editor',
"                \ 'row': (&lines - height) / 2,
"                \ 'col': (&columns - width) / 2,
"                \ 'width': width,
"                \ 'height': height }

"     let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"     call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
"   endfunction

"   let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" endif





" -----------------------------------Setting-----------------------------------
" Global variables
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler' "to show terminal buffer


" Golang highlight enable settings
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" Leader
let mapleader="\<Space>"

" General
syntax on
colorscheme neodark


set termguicolors
set number
set ignorecase
set hidden
set timeoutlen=500
set splitright
set mouse=a " hold option key when you select the text, then simple c-v; or just select the text, hold control key and right click and select copy manually

" ----------------------------------Keybindings--------------------------------
"nnoremap H gT
"nnoremap L gt
nnoremap H :bp<Cr>
nnoremap L :bn<Cr>
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Rg<Cr>
tnoremap <Esc> <C-\><C-n>




nnoremap <silent> <leader> :WhichKey '<Space>'<Cr>
" Define prefix dictionary
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
nnoremap <silent> <leader>sp :Rg<Cr>
let g:which_key_map.s.p = 'find text the current project'


let g:which_key_map.t = {'name': "tag/terminal"}

nnoremap <silent> <leader>tt :TagbarToggle<Cr>
let g:which_key_map.t.t = 'tagbar'

nnoremap <silent> <leader>tn :term<cr>
let g:which_key_map.t.n = 'open new terminal'

nnoremap <silent> <leader>tv :vsplit<cr>:term<cr>
let g:which_key_map.t.v = 'open new terminal in vertical split'

nnoremap <silent> <leader>ts :split<Cr>:term<Cr>
let g:which_key_map.t.s = 'Open new terminal in horizontal split'


let g:which_key_map.g = {'name': "git"}

nnoremap <silent> <leader>gb :Gblame<Cr>
let g:which_key_map.g.b = 'Git blame'

nnoremap <silent> <leader>gl :Glog<Cr>
let g:which_key_map.g.l = 'Git log'


" -----------------------------------Plugins-----------------------------------
call plug#begin('~/.local/share/nvim/site/pack/git-plugins/start')

"General
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!']}
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
" Plug 'ujihisa/neco-look' " look for english word


" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'


" For golang
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }



call plug#end()
