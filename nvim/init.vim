call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'fatih/molokai'
call plug#end()

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 1

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

set number
set hidden
set showcmd
set autowrite
set expandtab
set shiftwidth=2
set softtabstop=2

let mapleader="\<SPACE>"

nmap <Leader>p :CtrlP<CR>
nmap <Leader>w :CtrlPBuffer<CR>
nmap <Leader>o :CtrlPMRUFiles<CR>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d :GoDef<CR>
autocmd FileType go nmap <Leader>x :GoDefPop<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

