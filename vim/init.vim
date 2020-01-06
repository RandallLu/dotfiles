" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>




" -----------------------------------Function-----------------------------------
" function s:Cursor_Moved()
"   let cur_pos = winline()
"   if g:last_pos == 0
"     set cul
"     let g:last_pos = cur_pos
"     return
"   endif
"   let diff = g:last_pos - cur_pos
"   if diff > 1 || diff < -1
"     set cul
"   else
"     set nocul
"   endif
"   let g:last_pos = cur_pos
" endfunction
" autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved()
" let g:last_pos = 0






" -----------------------------------Setting-----------------------------------
" Global variables
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler' "to show terminal buffer
let g:airline_powerline_fonts = 1

let g:srcery_dim_lisp_paren = 1




" Golang highlight enable settings
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0


" Leader
let mapleader="\<Space>"

" General
syntax on
colorscheme srcery


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
autocmd! User * call which_key#register('<Space>', 'g:which_key_map')
" Define prefix dictionary
let g:which_key_map =  {}

" file key binding 
let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<Cr>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e ~/.vimrc<Cr>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>ff :FZF<Cr>
let g:which_key_map.f.f = 'open files in the current folder'

nnoremap <silent> <leader>fp :GFiles<Cr>
let g:which_key_map.f.p = 'open files in the current project'

" search/ripgrep key binding  
let g:which_key_map.s = {'name': '+search'}
nnoremap <silent> <leader>sp :Rg<Cr>
let g:which_key_map.s.p = 'find text the current project'

" tag/termnial key binding
let g:which_key_map.t = {'name': "+tag/terminal"}

nnoremap <silent> <leader>tb :TagbarToggle<Cr>
let g:which_key_map.t.t = 'tagbar'

nnoremap <silent> <leader>tc :Tags<Cr>
let g:which_key_map.t.c = 'create tags'

nnoremap <silent> <leader>tt :NERDTreeToggle<Cr>
let g:which_key_map.t.t = 'nerd tree'

nnoremap <silent> <leader>tn :term<cr>
let g:which_key_map.t.n = 'open new terminal'

nnoremap <silent> <leader>tv :vsplit<cr>:term<cr>
let g:which_key_map.t.v = 'open new terminal in vertical split'

nnoremap <silent> <leader>ts :split<Cr>:term<Cr>
let g:which_key_map.t.s = 'Open new terminal in horizontal split'

" git key binding 
let g:which_key_map.g = {'name': "+git"}

nnoremap <silent> <leader>gb :Gblame<Cr>
let g:which_key_map.g.b = 'Git blame'

nnoremap <silent> <leader>gl :Glog<Cr>
let g:which_key_map.g.l = 'Git log'

" coc.nvim key binding 
let g:which_key_map.c = {'name': '+coc.vim'}

let g:which_key_map.c.f = 'Format selected'
let g:which_key_map.c.a = 'CocList diagnostics'
let g:which_key_map.c.e = 'CosList commands'
let g:which_key_map.c.o = 'CocList outline'
let g:which_key_map.c.s = 'CocList -I symbols'
let g:which_key_map.c.j = 'CocNext'
let g:which_key_map.c.k = 'CocPrev'
let g:which_key_map.c.p = 'CocListResume'


" -----------------------------------Plugins-----------------------------------
call plug#begin('~/.local/share/nvim/site/pack/git-plugins/start')

"General
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!']}
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'



" Themes
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
Plug 'srcery-colors/srcery-vim'



" For golang
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }



call plug#end()
