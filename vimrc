" supposedly changes stuff based on filetype
filetype on
filetype plugin on

autocmd FileType python set commentstring=#\ %s

" fixes colors for dark background
set background=dark

" leader
let mapleader=","

" switch between buffers 
nnoremap <leader><leader> <c-^>

" Syntax highlighting
syntax on

" autoindent
filetype indent on
set autoindent

" line numbers
set nu

" Highlight search
set hlsearch
set incsearch

" Highlight search off
:nmap <leader>q :nohlsearch<CR>

" pathogen (plugins in folders)
execute pathogen#infect()

" ctrlp 
set runtimepath^=~/.vim/bundle/ctrlp.vim

" nerd tree
:nmap nt :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30

" closetag
" :au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
:let g:closetag_html_style=1
:source ~/.vim/bundle/closetag.vim

" escape key
:imap jj <Esc>

" spaces not tabs
set tabstop=4
set shiftwidth=4
set expandtab

" no line wrap
set nowrap

" save/restore folding
autocmd BufWinLeave .* mkview
autocmd BufWinEnter .* silent loadview

" folding
:set foldmethod=indent

" run flake8 (pep8 + pyflakes) on save
"autocmd BufWritePost *.py call Flake8()
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_always_populate_loc_list=1
