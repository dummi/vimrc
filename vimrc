
" Load pathogen first
runtime bundle/vim-pathogen/autoload/athogen.vim

set nocompatible "Not compatitable mode
set tabstop=4 "Set tab 4 space
set shiftwidth=4 "Set soft tab to 4 space
set scrolloff=7
set backspace=eol,start,indent
set smarttab
set nobackup "Do not create backup file
set number "Show line number
set nowritebackup "No backup files
set nowrap
set ruler "Show cursor position
set noswapfile "No swap file
set history=300 "Remember latest 300 command
set cinoptions=:0,g0,l0 "C-indent options
set autoread "Auto reload when file is modified by external program
set foldmethod=manual "Manually folding
set textwidth=78 "Auto line-break at 78
set background=dark "Tell syntax highlighter use dark theme
set wildmode=longest,list "Use bash-like completion mode

filetype plugin on
filetype indent on

syntax enable
set tags+=~/.vim/tags

" Save all files and run make
map <F5> :wall<CR>:make<CR>

" Make tags
map <F6> :!ctags -R --fields=+iaS --extra=+q --append . <CR>

map <C-F6> :!(cd ~/.vim/; ctags -r --filelds=+ias --extra=+q --append /usr/include ) <CR>

" Prev error after makE
map <F7> :cp<CR>

" Next error after make
map <F8> :cn<CR>

" Jump to window
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-l> <C-w>l


" Clear search hightlight when press <ESC> in normal mode
au InsertEnter * set nohlsearch
au InsertLeave * set hlsearch

source ~/.vim/imap/license.vim

" Auto strip useless space when file is saved
au BufWritePre * :call <SID>StripTrailingWhitespace()

fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l,c)
endfun

" Try to dectect whether to expand table
au BufRead * : call <SID>DectectExpandTab()


fun! <SID>DectectExpandTab()
    let l = line(".")
    let c = col(".")

    if search("^ ")
        set et
    else
        set noet
    endif
    call cursor(l,c)
endfun

" Force use 4 ws other than tab indent for python
au FileType python setlocal et
au FileType html setlocal ts=2
au FileType html setlocal sw=2
au FileType cpp set syntax=cpp11

au FileType c nmap K :!man -S 2,3,5,7 <cword><CR>
au FileType cpp set syntax=cpp11

let g:local_vimrc = {'names' : ['.vimrc'], 'hash_fun' : 'LVRHashOfFile'}

