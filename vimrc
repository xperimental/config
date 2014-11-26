execute pathogen#infect()

syntax on
filetype plugin indent on
set number
set hidden

let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
map <C-n> :NERDTreeToggle<CR>
